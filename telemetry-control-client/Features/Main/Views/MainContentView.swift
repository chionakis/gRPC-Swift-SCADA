import SwiftUI
import Charts
import GRPC
import NIO
import SwiftProtobuf

struct MainContentView: View {
    @State private var selectedItem: String? = "Home"
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedItem) {
                Text("Home")
                    .tag("Home")
                Text("Profile")
                    .tag("Profile")
                Text("Settings")
                    .tag("Settings")
                Text("AssoJet")
                    .tag("AssoJet")
                Text("Alarms")
                    .tag("Alarms")
            }
            .navigationTitle("Menu")
        } detail: {
            if let selectedItem = selectedItem {
                if selectedItem == "Home" {
                    SubscriptionView()
                } else if selectedItem == "Profile" {
                    ProfileView()
                } else if selectedItem == "Settings" {
                    GameControllerView()
                } else if selectedItem == "AssoJet" {
                    AssoJetView()
                } else if selectedItem == "Alarms" {
                    AlarmsView()
                } else {
                    DetailView(selectedItem: selectedItem)
                }
            } else {
                Text("Select an item")
                    .foregroundColor(.gray)
            }
        }
    }
}
