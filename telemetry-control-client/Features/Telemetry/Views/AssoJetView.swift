import SwiftUI
import SceneKit
import AppKit // Use NSColor for macOS environments
import UserNotifications

struct AssoJetView: View {
    @State private var changeColor = false
    @State private var scene: SCNScene? = nil
    @State private var isLoading = true

    var body: some View {
        VStack {
            Text("AssoJet")
                .font(.title)

            if isLoading {
                ProgressView("Loading Scene...")
                    .padding()
            } else {
                ZStack {
                    SceneView(
                        scene: scene,
                        options: [.allowsCameraControl, .autoenablesDefaultLighting]
                    )
                    .background(Color.cyan)
                    .onAppear {
                        updateNodeColor()
                    }
                }
                //.frame(width: 400, height: 400) // Adjust frame size as needed
                //.border(Color.red, width: 5) // Set frame color and width
                .padding()
            }

            Button(action: {
                changeColor.toggle()
                updateNodeColor()
                scheduleTestNotification()
                AlarmManager.shared.addAlarm(title: "High Temperature", message: "Temperature has exceeded safe limits.")

            }) {
                Text("Test Alarms")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .onAppear {
            loadSceneAsync()
        }
    }

    private func loadSceneAsync() {
        DispatchQueue.global(qos: .userInitiated).async {
            let loadedScene = SCNScene(named: "AJ_IIIv5_skid+TSS.scn")
            DispatchQueue.main.async {
                self.scene = loadedScene
                self.isLoading = false
            }
        }
    }

    private func releaseScene() {
        // Explicitly release the scene to free up resources when leaving the view
        scene = nil
        isLoading = true
    }

    func updateNodeColor() {
        guard let scene = scene else {
            print("Scene is not loaded")
            return
        }

        if let nodeToChange = scene.rootNode.childNode(withName: "MeshInstance_1695", recursively: true) {
            nodeToChange.enumerateChildNodes { childNode, _ in
                if let geometry = childNode.geometry, geometry.name == "Solid1" {
                    let material = geometry.firstMaterial
                    material?.diffuse.contents = changeColor ? NSColor.red : NSColor.green
                    print("Color of 'Solid1' geometry in 'MeshInstance_304' changed.")
                }
            }
        } else {
            print("Node 'MeshInstance_304' not found.")
        }
    }
    
    // Test notification function
    func scheduleTestNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Test Notification"
        content.body = "This is a test notification for AssoJetView."
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            }
        }
    }
}

