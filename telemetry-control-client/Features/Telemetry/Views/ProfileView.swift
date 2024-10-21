//
//  ProfileView.swift
//  telemetry-control-client
//
//  Created by Nikolaos Chionakis on 4/10/24.
//


import SwiftUI
import Charts
import GRPC
import NIO
import SwiftProtobuf
import GameController

struct ProfileView: View {
    @StateObject private var telemetryService = TelemetryService() // Use the service instance
    @State private var tagValues: [(Date, Double)] = []
    @State private var selectedValue: (Date, Double)? // Track the selected data point

    var body: some View {
        VStack {
            Chart(tagValues, id: \.0) { entry in
                LineMark(
                    x: .value("Time", entry.0),
                    y: .value("Value", entry.1)
                )
                .interpolationMethod(.monotone)
                .foregroundStyle(.blue)
            }
            .padding()
            .frame(height: 300)
            .chartXScale(domain: .automatic)
            .chartYScale(domain: .automatic)            .navigationTitle("Real-Time Tag Data")

            // Show the last tag value
            if let latestTag = telemetryService.tagValues.keys.sorted().last,
               let latestValue = telemetryService.tagValues[latestTag],
               let value = Double(latestValue) {
                Text("Latest Tag Value: \(value)")
                    .padding()
                }
        }
        .onAppear {
            telemetryService.subscribeToTags(opcEndpoint: "opc.tcp://Phoretos-ypologistes-Nikolaos.local:53530/OPCUA/SimulationServer", tagNames: ["1003"])
            telemetryService.onTagValueUpdate = { tagName, newValue in
                if Double(newValue) != nil {
                    }
            }
        }
        .onDisappear {
            // Optionally stop the subscription or clean up resources
        }
    }
}
