import SwiftUI

struct WelcomeScreen: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var navigateToSelection = false  //  Control navigation manually

    var body: some View {
        NavigationStack {
            ZStack {
                Image("WelcomeBG")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .frame(width: 450, height: 930)
                VStack {
                    
                Text("Tap Anywhere")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .ultraLight))
                        
                }
                .offset(y: 385)
            }
            .offset(y:-50)
            .onTapGesture {
                gameManager.resetGame()  //  Reset everything before navigating
                navigateToSelection = true
            }
            .navigationDestination(isPresented: $navigateToSelection) {
                PlayerSelectionView().environmentObject(gameManager)  //  Navigate properly
            }
        }
    }
}

#Preview {
    WelcomeScreen().environmentObject(GameManager())
}
