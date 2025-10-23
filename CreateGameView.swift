import SwiftUI

struct CreateGameView: View {
    @EnvironmentObject var gameStore: GameStore
    @Environment(\.presentationMode) var presentationMode

    @State private var title: String = ""
    @State private var location: String = ""
    @State private var date: Date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Game Details")) {
                    TextField("Title", text: $title)
                    TextField("Location", text: $location)
                    DatePicker("Date and Time", selection: $date)
                }
            }
            .navigationTitle("Create Game")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !title.isEmpty && !location.isEmpty {
                            gameStore.addGame(title: title, location: location, date: date)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}
