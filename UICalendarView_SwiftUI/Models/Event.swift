// by Stewart Lynch on 2022-06-28
// Using Swift 5.0

import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case alimentaçao, casa, viagens, compras, outros
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .alimentaçao:
                return "🍽️"
            case .casa:
                return "🏡"
            case .viagens:
                return "🛫"
            case .compras:
                return "🛍️"
            case .outros:
                return "📌"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
            ],
            from: date)
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, eventType: EventType = .outros, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .casa, date: Date().diff(numDays: 0), note: "Take dog to groomers"),
            Event(date: Date().diff(numDays: -1), note: "Get gift for Emily"),
            Event(eventType: .casa, date: Date().diff(numDays: 6), note: "File tax returns."),
        ]
    }
}
