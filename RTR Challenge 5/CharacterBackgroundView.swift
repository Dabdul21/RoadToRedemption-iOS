import SwiftUI

struct CharacterBackgroundView: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var navigateToStory = false

    var body: some View {
        ZStack {
            // ✅ Ensure only ONE background shows
            if let character = gameManager.selectedCharacter {
                Image(character == "Aldreic" ? "Aldric" : "Thane")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }

            VStack {
                // ✅ Ensure only ONE story shows
                Text(gameManager.selectedCharacter == "Aldreic" ? aldreicStory : thaneStory)
                    .font(.system(size: 22)).bold()
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 350, maxHeight: 230)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(20)
                    .offset(y:-205)

                Button("Tap Anywhere") {
                    navigateToStory = true
                }
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .ultraLight))
                .offset(y:200)
            }
        }
        .contentShape(Rectangle())  // ✅ Makes the whole screen tappable
                .onTapGesture {
                    navigateToStory = true  // ✅ Navigate when tapped anywhere
                }
        .navigationDestination(isPresented: $navigateToStory) {
            ScreenOne().environmentObject(gameManager)
        }
    }

    private var aldreicStory: String {
        """
        A survivor forged by hardship, Aldric rises from nothing with unyielding determination. 
        Where others falter, he endures—driven not by fate, but by sheer will. 
        """
    }

    private var thaneStory: String {
        """
        A scholar of the unseen, he unravels mysteries that others fear to question. 
        Where others see the world as it is, he sees what it could become.
        """
    }
}

#Preview {
    CharacterBackgroundView().environmentObject(GameManager())
}
