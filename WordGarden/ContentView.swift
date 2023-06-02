import SwiftUI

var words = ["Dog", "Cat", "Horse"]

struct ContentView: View {
    
    @State private var wordsGuessed: Int = 0
    @State private var wordsMissed: Int = 0
    @State private var wordsToGuess: [String] = ["SWIFT", "CAT", "DOG"]
    @State private var gameStatus: Int = 0
    
    @State private var currentWord: String = ""
    
    @State private var guessedLetter: String = ""
    @State private var isBtnDisabled: Bool = true
    @State private var playAgainHidden: Bool = true
    
    func guessLetter() {
        // TODO: Logic on guess
    }
    
    func endGame() {
        // TODO: Remove the word from the array
    }
    
    var body: some View {

        
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Words Guessed: \(wordsGuessed)")
                    Text("Words Missed: \(wordsMissed)")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Words to Guess: \(wordsToGuess.count - (wordsGuessed + wordsMissed))")
                    Text("Words in Game: \(wordsToGuess.count)")
                }
            }
            .font(.system(size: 12))
            .padding()
            
            
            
            Text("How Many Guesses to Uncover the Hidden Word?")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            
            if (playAgainHidden) {
                HStack {
                    
                    TextField("", text: $guessedLetter)
                        .frame(width: 30, height: 30)
                        .border(.tertiary)
                        .shadow(radius: 0.9)
                        .textInputAutocapitalization(.characters)
                    
                    Button("Guess a Letter") {
                        guessLetter() // TODO: Check how to inline this
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(isBtnDisabled)
                }
            } else {
                Button("Another word?") {
                    // TODO: Add another word button action here
                    playAgainHidden = true
                }
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
            
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
