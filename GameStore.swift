import Foundation
import Combine

class GameStore: ObservableObject {
    @Published var games: [Game]

    init(games: [Game] = []) {
        self.games = games
    }

    func addGame(title: String, location: String, date: Date) {
        let game = Game(title: title, location: location, date: date)
        games.append(game)
    }
}
