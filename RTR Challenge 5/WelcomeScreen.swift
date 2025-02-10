import SwiftUI

struct WelcomeScreen: View {
    @StateObject var audioManager = AudioManager.shared
    @State private var navigateToNextScreen = false // Track navigation state

    var body: some View {
        NavigationStack {
            ZStack {
                Image("BGG")
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
                .offset(y: -100) // Increase negative value to move it higher

            }
            .onTapGesture {
                navigateToNextScreen = true // Trigger navigation on tap
            }
            .navigationDestination(isPresented: $navigateToNextScreen) {
                ScreenOne() // Navigate to ScreenOne on tap
            }
        }
    }
}

#Preview {
    ContentView()
}
