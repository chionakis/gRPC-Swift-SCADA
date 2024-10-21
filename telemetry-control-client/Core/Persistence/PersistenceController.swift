import SwiftData

@MainActor
struct PersistenceController {
    static let shared = PersistenceController()

    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: Alarm.self)
        } catch {
            fatalError("Failed to create container: \(error.localizedDescription)")
        }
    }

    var context: ModelContext {
        return container.mainContext
    }

    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }
}

