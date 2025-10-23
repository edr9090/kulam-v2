import Foundation

struct Game: Identifiable {
    let id = UUID()
    var title: String
    var location: String
    var date: Date
}
