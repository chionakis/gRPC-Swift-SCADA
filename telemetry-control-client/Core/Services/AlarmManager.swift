import Foundation
import SwiftData

@MainActor
class AlarmManager: ObservableObject {
    static let shared = AlarmManager()

    @Published var alarms: [Alarm] = []

    // Reference to the SwiftData context
    private let context: ModelContext

    private init() {
        self.context = PersistenceController.shared.context
        fetchAlarms()
    }

    // Function to add a new alarm
    func addAlarm(title: String, message: String) {
        let newAlarm = Alarm(title: title, message: message)
        context.insert(newAlarm)
        saveContext()
        self.alarms.append(newAlarm)
    }

    // Function to acknowledge an existing alarm
    func acknowledgeAlarm(id: UUID) {
        if let alarm = alarms.first(where: { $0.id == id }) {
            alarm.isAcknowledged = true
            saveContext()
        }
    }

    // Function to delete an individual alarm
    func deleteAlarm(id: UUID) {
        if let index = alarms.firstIndex(where: { $0.id == id }) {
            let alarm = alarms[index]
            context.delete(alarm)
            saveContext()
            self.alarms.remove(at: index)
        }
    }

    // Function to clear all alarms
    func clearAllAlarms() {
        alarms.forEach { alarm in
            context.delete(alarm)
        }
        saveContext()
        self.alarms.removeAll()
    }

    // Function to fetch all alarms from persistence
    private func fetchAlarms() {
        do {
            let fetchedAlarms: [Alarm] = try context.fetch(FetchDescriptor<Alarm>())
            self.alarms = fetchedAlarms
        } catch {
            print("Failed to fetch alarms: \(error.localizedDescription)")
        }
    }

    // Function to save the context
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }
}

