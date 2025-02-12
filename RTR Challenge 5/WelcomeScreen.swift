import SwiftUI

struct WelcomeScreen: View {
    @StateObject var audioManager = AudioManager.shared
    @State private var navigateToSelection = false
    @EnvironmentObject var gameManager: GameManager

    var body: some View {
        NavigationStack {
            ZStack {
                Image("BG")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .frame(width: 450, height: 1190)

                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.black)
                        .frame(width: 200, height: 50)
                        .overlay(
                            Text("PLAY")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold)))
                }
                .offset(y: -100)
            }
            .onTapGesture {
                navigateToSelection = true
            }
            .navigationDestination(isPresented: $navigateToSelection) {
                PlayerSelectionView(gameManager: gameManager) // ✅ Navigates to selection first
            }
        }
    }
}

#Preview {
    WelcomeScreen().environmentObject(GameManager())
}
