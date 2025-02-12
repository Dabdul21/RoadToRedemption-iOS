import SwiftUI

struct CharacterBackgroundView: View {
    @ObservedObject var gameManager: GameManager
    @State private var navigateToStory = false

    var body: some View {
        ZStack {
            Image(gameManager.selectedCharacter == "Aldreic" ? "AldreicBackground" : "ThaneBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text(characterStory)
                    .font(.custom("STFangsong", size: 22))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)

                Button("Continue") {
                    navigateToStory = true
                }
                .font(.title2)
                .padding()
                .frame(width: 200)
                .background(Color.white.opacity(0.8))
                .foregroundColor(.black)
                .cornerRadius(15)
                .shadow(radius: 8)
            }
        }
        .navigationDestination(isPresented: $navigateToStory) {
            ScreenOne(gameManager: gameManager) // ✅ Ensure GameManager is passed properly
        }
    }

    private var characterStory: String {
        gameManager.selectedCharacter == "Aldreic" ? aldreicStory : thaneStory
    }

    private var aldreicStory: String {
        """
        A warrior forged in the fires of war, Aldreic stands as an unyielding shield against the chaos. 
        Bound by honor, his path is one of discipline, sacrifice, and unwavering courage.
        """
    }

    private var thaneStory: String {
        """
        A strategist whose mind weaves through the battlefield like a blade, Thane fights with intelligence and foresight. 
        Every step he takes is calculated, every move a dance of precision.
        """
    }
}
