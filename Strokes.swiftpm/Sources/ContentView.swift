import SwiftUI

struct ContentView: View {
    @State private var character: String = "水"
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter a character", text: $searchText, onCommit: {
                        updateCharacter()
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                    Button("Search") {
                        updateCharacter()
                    }
                    .padding(.trailing)
                }

                HanziWriterView(character: character)
                    .frame(width: 300, height: 300)
                    .border(Color.gray, width: 1)

                Spacer()
            }
            .navigationTitle("Strokes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                     Button(action: {
                         // Placeholder for settings
                     }) {
                         Image(systemName: "gear")
                     }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func updateCharacter() {
        if !searchText.isEmpty {
            // Take only the first character if multiple are entered
            if let firstChar = searchText.first {
                character = String(firstChar)
            }
            searchText = ""
        }
    }
}
