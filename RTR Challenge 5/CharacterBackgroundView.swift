import SwiftUI

struct CharacterBackgroundView: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var navigateToStory = false

    var body: some View {
        ZStack {
            // ✅ Ensure only ONE background shows
            if let character = gameManager.selectedCharacter {
                Image(character == "Aldreic" ? "BG_Aldreic" : "BG_Thane")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }

            VStack {
                // ✅ Ensure only ONE story shows
                Text(gameManager.selectedCharacter == "Aldreic" ? aldreicStory : thaneStory)
                    .font(.custom("STFangsong", size: 23))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 350, maxHeight: 310)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(20)
                    .offset(y:-100)

                Button("Continue") {
                    navigateToStory = true
                }
                .font(.title2)
                .padding()
                .frame(width: 200)
                .background(Color.white.opacity(0.8))
                .foregroundColor(.black)
                .cornerRadius(20)
                .shadow(radius: 8)
            }
        }
        .navigationDestination(isPresented: $navigateToStory) {
            ScreenOne().environmentObject(gameManager)
        }
    }

    private var aldreicStory: String {
        """
        Born into poverty in the village of Valleys, Aldric was a boy fueled by dreams of glory and a heart aflame with courage. He grew up next to Thane, an ingenious but frail friend whose ambitions lay elsewhere. Together, they survived harsh winters and looming war—until the news that raiders from a distant land descended on their home.
        """
    }

    private var thaneStory: String {
        """
        A strategist whose mind weaves through the battlefield like a blade, Thane fights with intelligence and foresight. 
        Every step he takes is calculated, every move a dance of precision.
        """
    }
}

#Preview {
    CharacterBackgroundView().environmentObject(GameManager())
}
