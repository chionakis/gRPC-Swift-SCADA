//
//  telemetry_control_clientApp.swift
//  telemetry-control-client
//
//  Created by Nikolaos Chionakis on 12/9/24.
//

import SwiftUI
import UserNotifications

@main
struct telemetry_control_clientApp: App {

    @AppStorage("isSignedIn") var isSignedIn: Bool = false // Persist sign-in status

    // Strong reference to NotificationDelegate
    private let notificationDelegate = NotificationDelegate()

    init() {
        // Set the notification delegate
        UNUserNotificationCenter.current().delegate = notificationDelegate
        // Request notification permissions
        NotificationManager.shared.requestNotificationAuthorization()
    }

    var body: some Scene {
        WindowGroup {
            //if isSignedIn {
                MainContentView() // Show the main content of the app if signed in
            //} else {
            //    AuthenticationView() // Show sign-in view if not signed in
            //}
        }
    }
}

