//
//  SubscriptionView.swift
//  telemetry-control-client
//
//  Created by Nikolaos Chionakis on 4/10/24.
//


import SwiftUI
import Charts
import GRPC
import NIO
import SwiftProtobuf

struct SubscriptionView: View {
    @StateObject private var telemetryService = TelemetryService() // Use the service instance
    @State private var opcEndpoint: String = "opc.tcp://10.250.17.1:4840"
    @State private var tagNames: String = "\"machine\".\"test\""

    var body: some View {
        VStack {
            TextField("Enter OPC UA Endpoint", text: $opcEndpoint)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter Tag Names (comma separated)", text: $tagNames)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                let tags = tagNames.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                telemetryService.subscribeToTags(opcEndpoint: opcEndpoint, tagNames: tags)
            }) {
                Text("Subscribe to Tag Values")
            }

            // Display the latest tag values
            ForEach(telemetryService.tagValues.keys.sorted(), id: \.self) { tagName in
                Text("\(tagName): \(telemetryService.tagValues[tagName] ?? "-")")
                    .padding()
            }

            Spacer()
        }
        .navigationTitle("Subscription View")
        .padding()
    }
}
