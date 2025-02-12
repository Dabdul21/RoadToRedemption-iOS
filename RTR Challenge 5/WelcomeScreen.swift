import SwiftUI

struct WelcomeScreen: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var navigateToSelection = false  // ✅ Control navigation manually

    var body: some View {
        NavigationStack {
            ZStack {
                Image("BG")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()

                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.black)
                        .frame(width: 200, height: 50)
                        .overlay(
                            Text("PLAY")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                        )
                }
                .offset(y: -100)
            }
            .onTapGesture {
                gameManager.resetGame()  // ✅ Reset everything before navigating
                navigateToSelection = true
            }
            .navigationDestination(isPresented: $navigateToSelection) {
                PlayerSelectionView().environmentObject(gameManager)  // ✅ Navigate properly
            }
        }
    }
}

#Preview {
    WelcomeScreen().environmentObject(GameManager())
}
