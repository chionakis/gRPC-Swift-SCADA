import SwiftUI
import AuthenticationServices

struct SignInWithAppleView: View {
    @AppStorage("isSignedIn") var isSignedIn: Bool = false

    var body: some View {
        VStack {
            SignInWithAppleButton(
                .signIn,
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        handleAuthorization(authResults)
                    case .failure(let error):
                        print("Authorization failed: \(error.localizedDescription)")
                    }
                }
            )
            .signInWithAppleButtonStyle(.black)
            .frame(width: 280, height: 45)
            .padding()
        }
    }

    private func handleAuthorization(_ authResults: ASAuthorization) {
        if let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user

            // Save the user identifier using the UserManager
            UserManager.saveUserIdentifier(userIdentifier)

            // Mark the user as signed in
            isSignedIn = true
        }
    }
}
