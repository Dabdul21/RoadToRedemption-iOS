import SwiftUI

struct ContentView: View {
    @StateObject var audioManager = AudioManager.shared
    @StateObject var gameManager = GameManager()
    @State private var navigationPath = NavigationPath()  // ✅ Track navigation state

    var body: some View {
        NavigationStack(path: $navigationPath) {
            WelcomeScreen()
                .environmentObject(gameManager)
                .onChange(of: gameManager.goToWelcomeScreen) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        print("🎯 ContentView: Resetting NavigationStack!")  // ✅ Debug navigation reset
                        navigationPath = NavigationPath()  // ✅ Fully clears navigation stack
                        gameManager.goToWelcomeScreen = false  // ✅ Reset flag
                    }
                }
        }
    }
}

#Preview {
    ContentView().environmentObject(GameManager())
}
