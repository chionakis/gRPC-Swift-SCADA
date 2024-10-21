import SwiftUI
import GameController

struct GameControllerView: View {
    
    // Optional: You can store a reference to the connected controller
    @State private var controller: GCController?

    var body: some View {
        Text("Game Controller Example")
            .onAppear {
                setupControllerObservers()
            }
            .onDisappear {
                removeControllerObservers()
            }
    }
    
    // Function to set up NotificationCenter observers
    func setupControllerObservers() {
        NotificationCenter.default.addObserver(
            forName: .GCControllerDidConnect,
            object: nil,
            queue: .main
        ) { notification in
            if let controller = notification.object as? GCController {
                self.controllerDidConnect(controller: controller)
            }
        }

        NotificationCenter.default.addObserver(
            forName: .GCControllerDidDisconnect,
            object: nil,
            queue: .main
        ) { notification in
            self.controllerDidDisconnect()
        }
    }
    
    // Function to remove NotificationCenter observers when view disappears
    func removeControllerObservers() {
        NotificationCenter.default.removeObserver(self, name: .GCControllerDidConnect, object: nil)
        NotificationCenter.default.removeObserver(self, name: .GCControllerDidDisconnect, object: nil)
    }
    
    // Function called when a controller is connected
    func controllerDidConnect(controller: GCController) {
        print("Controller connected: \(controller.vendorName ?? "Unknown")")
        self.controller = controller
        setupController(controller)
    }
    
    // Function called when a controller is disconnected
    func controllerDidDisconnect() {
        print("Controller disconnected.")
        self.controller = nil
    }
    
    // Setup the controller's button and input handlers
    func setupController(_ controller: GCController) {
        if let gamepad = controller.extendedGamepad {
            gamepad.buttonA.pressedChangedHandler = { (button, value, pressed) in
                if pressed {
                    print("X button pressed")
                    // Add your action for X button press
                }
            }
        }
    }
}

struct GameControllerView_Previews: PreviewProvider {
    static var previews: some View {
        GameControllerView()
    }
}

