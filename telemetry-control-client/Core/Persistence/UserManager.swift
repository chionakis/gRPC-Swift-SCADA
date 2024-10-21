//
//  UserManager.swift
//  telemetry-control-client
//
//  Created by Nikolaos Chionakis on 4/10/24.
//


import Foundation

class UserManager {
    
    // Save the Apple User Identifier to UserDefaults (or use Keychain for more secure storage)
    static func saveUserIdentifier(_ userIdentifier: String) {
        UserDefaults.standard.set(userIdentifier, forKey: "appleUserIdentifier")
    }

    // Retrieve the saved Apple User Identifier
    static func getUserIdentifier() -> String? {
        return UserDefaults.standard.string(forKey: "appleUserIdentifier")
    }

    // Clear the User Identifier (on sign-out, for example)
    static func clearUserIdentifier() {
        UserDefaults.standard.removeObject(forKey: "appleUserIdentifier")
    }
}
