import Foundation
import GRPC
import NIO
import NIOSSL
import SwiftProtobuf

class TelemetryService: ObservableObject {
    @Published var tagValues: [String: String] = [:] // Dictionary to store tag values for multiple tags
    @Published var writeStatuses: [String: String] = [:] // Dictionary to store write status for multiple tags
    @Published var historyData: [String: [String]] = [:] // Dictionary to store history data for multiple tags
    @Published var eventMessages: [String] = []
    @Published var alarmMessages: [String] = []
    private var group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    var onTagValueUpdate: ((String, String) -> Void)? // Closure with tag name and value

    private lazy var channel: ClientConnection = {
        return ClientConnection.insecure(group: group)
            .connect(host: "localhost", port: 50051)
    }()

    private lazy var client: Telemetry_TelemetryControlServiceNIOClient = {
        return Telemetry_TelemetryControlServiceNIOClient(channel: channel)
    }()

    func subscribeToTags(opcEndpoint: String, tagNames: [String]) {
        var request = Telemetry_TagRequest()
        request.opcEndpoint = opcEndpoint
        request.tagNames = tagNames
        let call = client.subscribe(request) { response in
            DispatchQueue.main.async {
                // Update the tagValues dictionary with the new value
                self.tagValues[response.tagName] = response.value
                // Call the onTagValueUpdate closure with the tag name and new value
                self.onTagValueUpdate?(response.tagName, response.value)
            }
        }

        call.status.whenComplete { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let status):
                    print("Subscription completed with status: \(status)")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }

    func readTags(opcEndpoint: String, tagNames: [String], completion: @escaping ([String: String]) -> Void) {
        var request = Telemetry_TagRequest()
        request.tagNames = tagNames
        let call = client.read(request)
        call.response.whenComplete { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    var responses: [String: String] = [:]
                    for tagResponse in response.tagResponses {
                        responses[tagResponse.tagName] = tagResponse.value
                    }
                    completion(responses)
                case .failure(let error):
                    var errorResponses: [String: String] = [:]
                    for tagName in tagNames {
                        errorResponses[tagName] = "Error: \(error.localizedDescription)"
                    }
                    completion(errorResponses)
                }
            }
        }
    }

    func writeTags(opcEndpoint: String, tags: [String: String]) {
        var request = Telemetry_WriteTagRequest()
        request.tagNames = Array(tags.keys)
        request.values = Array(tags.values)
        let call = client.write(request)
        call.response.whenComplete { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    for (_, tagName) in request.tagNames.enumerated() {
                        self.writeStatuses[tagName] = response.success ? "Write successful" : "Write failed: \(response.message)"
                    }
                case .failure(let error):
                    for tagName in request.tagNames {
                        self.writeStatuses[tagName] = "Error: \(error.localizedDescription)"
                    }
                }
            }
        }
    }

    func readHistory(opcEndpoint: String, tagNames: [String], startTime: String, endTime: String, maxValues: Int) {
        var request = Telemetry_HistoryReadTagRequest()
        request.tagNames = tagNames
        request.startTime = startTime
        request.endTime = endTime
        request.maxValues = Int32(maxValues)

        let call = client.readHistory(request) { response in
            DispatchQueue.main.async {
                if self.historyData[response.tagName] == nil {
                    self.historyData[response.tagName] = []
                }
                self.historyData[response.tagName]?.append("\(response.timestamp): \(response.value)")
            }
        }

        call.status.whenComplete { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let status):
                    print("Historical read completed with status: \(status)")
                case .failure(let error):
                    for tagName in tagNames {
                        if self.historyData[tagName] == nil {
                            self.historyData[tagName] = []
                        }
                        self.historyData[tagName]?.append("Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }

    func subscribeToEvents(opcEndpoint: String) {
        let request = Telemetry_TagRequest()
        let call = client.subscribeEvents(request) { response in
            DispatchQueue.main.async {
                self.eventMessages.append("\(response.timestamp): [\(response.sourceName)] \(response.message)")
            }
        }

        call.status.whenComplete { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let status):
                    print("Event subscription completed with status: \(status)")
                case .failure(let error):
                    self.eventMessages.append("Error: \(error.localizedDescription)")
                }
            }
        }
    }

    func subscribeToAlarms(opcEndpoint: String) {
        let request = Telemetry_TagRequest()
        let call = client.subscribeAlarms(request) { response in
            DispatchQueue.main.async {
                self.alarmMessages.append("\(response.timestamp): [\(response.sourceName)] \(response.message) - Active: \(response.activeState), Acked: \(response.ackedState), Confirmed: \(response.confirmedState)")
            }
        }

        call.status.whenComplete { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let status):
                    print("Alarm subscription completed with status: \(status)")
                case .failure(let error):
                    self.alarmMessages.append("Error: \(error.localizedDescription)")
                }
            }
        }
    }

    func acknowledgeAlarm(objectIds: [String], eventIds: [String], comment: String, completion: @escaping ([String: String]) -> Void) {
        var request = Telemetry_AcknowledgeAlarmRequest()
        request.objectIds = objectIds
        request.eventIds = eventIds
        request.comment = comment

        let call = client.acknowledgeAlarm(request)
        call.response.whenComplete { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    var ackResults: [String: String] = [:]
                    for result in response.results {
                        ackResults[result.eventID] = result.success ? "Acknowledgment successful" : "Acknowledgment failed: \(result.message)"
                    }
                    completion(ackResults)
                case .failure(let error):
                    var errorResults: [String: String] = [:]
                    for eventId in eventIds {
                        errorResults[eventId] = "Error: \(error.localizedDescription)"
                    }
                    completion(errorResults)
                }
            }
        }
    }

    deinit {
        try? group.syncShutdownGracefully()
    }
}
