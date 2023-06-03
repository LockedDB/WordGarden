import SwiftUI

var words = ["Dog", "Cat", "Horse"]

struct ContentView: View {
    
    @State private var wordsGuessed: Int = 0
    @State private var wordsMissed: Int = 0
    @State private var gameStatus: Int = 0
    
    @State private var currentWordIndex: Int = 0
    @State private var wordToGuess: String = ""
    @State private var revealedWord: String = ""
    @State private var lettersGuessed: String = ""
    
    @State private var guessedLetter: String = ""
    @State private var playAgainHidden: Bool = true
    @FocusState private var textFieldIsFocused: Bool
    
    private let wordsToGuess: [String] = ["SWIFT", "CAT", "DOG"]
    
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
            
            Text(revealedWord)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            if (playAgainHidden) {
                HStack {
                    
                    TextField("", text: $guessedLetter)
                        .frame(width: 30, height: 30)
                        .border(.tertiary)
                        .shadow(radius: 0.9)
                        .textInputAutocapitalization(.characters)
                        .keyboardType(.asciiCapable)
                        .submitLabel(.done)
                        .onSubmit {
                            guard guessedLetter != "" else {
                                return
                            }
                            guessALetter()
                        }
                        .autocorrectionDisabled()
                        .onChange(of: guessedLetter) { _ in
                            // Trim all execpt letters from the input
                            guessedLetter = guessedLetter.trimmingCharacters(in: .letters.inverted)
                            guard let lastChar = guessedLetter.last else {
                                return
                            }
                            guessedLetter = String(lastChar).uppercased()
                        }
                        .focused($textFieldIsFocused)
                    
                    Button("Guess a Letter") {
                        guessALetter()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                    .disabled(guessedLetter.isEmpty)
                }
            } else {
                Button("Another word?") {
                    // TODO: Add another word button action here
                    
                }
                .buttonStyle(.borderedProminent)
            }
            
            
            Spacer()
            
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear() {
            wordToGuess = wordsToGuess[currentWordIndex]
            revealedWord = "_" + String(repeating: " _", count: wordToGuess.count - 1)
        }
    }
    
    func guessALetter() {
        textFieldIsFocused = false
        lettersGuessed = lettersGuessed + guessedLetter
        
        revealedWord = ""
        wordToGuess.forEach { letter in
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + "\(letter)"
            } else {
                revealedWord = revealedWord + "_ "
            }
        }
        revealedWord.removeLast()
        guessedLetter = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
