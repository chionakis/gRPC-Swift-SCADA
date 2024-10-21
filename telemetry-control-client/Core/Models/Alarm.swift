import Foundation
import SwiftData

@Model public class Alarm: Identifiable {
    public var id: UUID
    var title: String
    var message: String
    var date: Date
    var isAcknowledged: Bool

    // Custom initializer
    public init(id: UUID = UUID(), title: String, message: String, date: Date = Date(), isAcknowledged: Bool = false) {
        self.id = id
        self.title = title
        self.message = message
        self.date = date
        self.isAcknowledged = isAcknowledged
    }
}

