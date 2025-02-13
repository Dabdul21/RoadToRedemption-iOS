import SwiftUI

struct ScreenOne: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var isBottomSheetVisible = false

    var body: some View {
        ZStack {
            Image("BackGroundImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer().frame(height: 230)

                if gameManager.isGameOver {
                    VStack {
                        Text("YOU DIED")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.red)
                            .shadow(radius: 10)
                            .padding()

                        Button("Restart") {
                            gameManager.resetGame()
                            forceResetToWelcomeScreen()  // ✅ Force reset
                        }
                        .font(.title2)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                } else {
                    if let character = gameManager.selectedCharacter,
                       let storyNode = gameManager.story[character]?[gameManager.currentStoryNode] {

                        VStack(spacing: 30) {
                            ForEach(storyNode.choices.keys.sorted(), id: \.self) { choice in
                                Button(action: {
                                    gameManager.chooseOption(choice)
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.black.opacity(0.7)) // Semi-transparent black
                                            .frame(width: 370, height: 80) // Adjusted size to match original button
                                            .overlay(
                                                Text(choice)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                    .shadow(radius: 2)
                                                    .frame(width: 340, height: 80) // Adjusted size to match original button
                                                    .multilineTextAlignment(.center)
                                                    .padding(.horizontal, 20)


                                            )
                                    }
                                }
//                                .frame(width: 370, height: 65)
                            }
                        }
                        .padding(.leading, 11)
                    } else {
                        Text("No Story Found")
                            .foregroundColor(.red)
                            .font(.title)
                            .bold()
                    }
                }

                Spacer()

                // ✅ Restored BottomView for Story Text
                if let character = gameManager.selectedCharacter,
                   let storyText = gameManager.story[character]?[gameManager.currentStoryNode]?.text {
                    let storyText = String(storyText.prefix(85)) + " ..." // ✅ Show first 80 characters

                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.black.opacity(0.7))
                        .frame(width: 370, height: 150)
                        .overlay(
                            Text(storyText)
                                .font(.system(size: 22)).bold()
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                                .padding()
                                .multilineTextAlignment(.center)
                        )
                        .onTapGesture {
                            isBottomSheetVisible = true
                        }
                        .padding(.bottom, 100)
                }
            }
        }
        .sheet(isPresented: $isBottomSheetVisible) {
            BottomView(
                isVisible: $isBottomSheetVisible,
                storyText: gameManager.story[gameManager.selectedCharacter ?? ""]?[gameManager.currentStoryNode]?.text ?? "No Story Found"
            )
        }
        .sheet(isPresented: $gameManager.showingOutcome) {
            if let outcome = gameManager.selectedOutcome {
                ChoiceOutcomeView(outcome: outcome, showOutcome: $gameManager.showingOutcome)
            }
        }
    }

    // ✅ Forcefully reset navigation to WelcomeScreen
    private func forceResetToWelcomeScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = scene.windows.first {
                print("🎯 ScreenOne: Forcing reset to WelcomeScreen!")  // ✅ Debug navigation
                window.rootViewController = UIHostingController(rootView: WelcomeScreen().environmentObject(GameManager()))
                window.makeKeyAndVisible()
            }
        }
        
    }

}
