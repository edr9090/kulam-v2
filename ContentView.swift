import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameStore: GameStore
    @State private var showingCreateGame = false

    var body: some View {
        NavigationView {
            List {
                ForEach(gameStore.games) { game in
                    VStack(alignment: .leading) {
                        Text(game.title)
                            .font(.headline)
                        Text(game.location)
                        Text(game.date, style: .date)
                        Text(game.date, style: .time)
                    }
                }
            }
            .navigationTitle("Kulam Games")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingCreateGame = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingCreateGame) {
                CreateGameView()
                    .environmentObject(gameStore)
            }
        }
    }
}
