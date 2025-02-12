import SwiftUI

struct PlayerSelectionView: View {
    @ObservedObject var gameManager: GameManager
    @State private var navigateToBackground = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(Color.orange.opacity(0.5))

                VStack(spacing: 30) {
                    Text("Two lives intertwined by fate, yet shaped by different choices.\nOne a shield of courage, the other a mind of ingenuity.\nTheir journeys are yours to decide.\nChoose the path that speaks to you.")
                        .font(.custom("STFangsong", size: 20))
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                        .shadow(radius: 5)
                        .padding()
                        .frame(maxWidth: 370)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(20)
                        .offset(y: -240)
                }
                .padding(.horizontal, 20)
                .padding(.top, 40)

                VStack(spacing: 20) {
                    Button(action: {
                        gameManager.selectCharacter("Aldreic") // ✅ Ensure character is saved
                        navigateToBackground = true
                    }) {
                        Text("Aldreic")
                            .font(.custom("STFangsong", size: 28))
                            .padding()
                            .frame(width: 250)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(radius: 8)
                    }

                    Button(action: {
                        gameManager.selectCharacter("Thane") // ✅ Ensure character is saved
                        navigateToBackground = true
                    }) {
                        Text("Thane")
                            .font(.custom("STFangsong", size: 28))
                            .padding()
                            .frame(width: 250)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(radius: 8)
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToBackground) {
                CharacterBackgroundView(gameManager: gameManager)
            }
        }
    }
}

#Preview {
    PlayerSelectionView(gameManager: GameManager())
}
