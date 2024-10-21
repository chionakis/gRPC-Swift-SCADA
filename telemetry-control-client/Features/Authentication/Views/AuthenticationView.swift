//
//  AuthenticationView.swift
//  telemetry-control-client
//
//  Created by Nikolaos Chionakis on 4/10/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome! Please sign in.")
                    .font(.title)



                // Sign in with Google and Apple buttons
                SignInWithAppleView()
                    .frame(width: 280, height: 45)
                    .padding()

                //SignInWithGoogleView()
                //    .frame(width: 280, height: 45)
                //    .padding()
            }
        }
    }
}
