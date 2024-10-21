//
//  DetailView.swift
//  telemetry-control-client
//
//  Created by Nikolaos Chionakis on 4/10/24.
//


import SwiftUI
import Charts
import GRPC
import NIO
import SwiftProtobuf

struct DetailView: View {
    var selectedItem: String

    var body: some View {
        VStack {
            Text("\(selectedItem) View")
                .font(.largeTitle)
            Spacer()
        }
        .navigationTitle(selectedItem)
        .padding()
    }
}