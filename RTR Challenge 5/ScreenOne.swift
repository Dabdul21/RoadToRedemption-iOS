import SwiftUI

struct ScreenOne: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var isBottomSheetVisible = false

    var body: some View {
        ZStack {
            Image("OutcomeBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer().frame(height: 230)

                if gameManager.isGameOver {
                    ZStack {
                        Image("SelectBG")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .frame(width: 410, height: 320)

                        VStack {
                            Text("YOU DIED")
                                .font(.system(size: 55, weight: .heavy, design: .default))
                                .bold()
                                .foregroundColor(.red)
                                .shadow(radius: 1)
                                .offset(y: 15)
                            
//                            Text(
//                                "YOU MADE SOME AMBITIOUS DECISIONS AND IT DID NOT END WELL....")
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                            .padding()
//                            .shadow(radius: 1)
//                            .offset(y: -170)
//                            .frame(maxWidth: 350) // Allows text to wrap properly without being cut off
//                            .multilineTextAlignment(.center) // Centers text nicely

                            

                            Text("Tap anywhere to replay")
                                .font(.title3)
                                .bold()
                                .padding()
                                .foregroundColor(.white)
                                .cornerRadius(2)
                                .offset(y: -15)
                        }
                    }
                    .contentShape(Rectangle()) // Ensures full screen is tappable
                    .onTapGesture {
                        gameManager.resetGame()
                        forceResetToWelcomeScreen() // ✅ Restart game
                    }

                } else {
                    if let character = gameManager.selectedCharacter,
                       let storyNode = gameManager.story[character]?[gameManager.currentStoryNode] {

                        VStack(spacing: 25) { // how spaced out each button is from each other
                            ForEach(storyNode.choices.keys.sorted(), id: \.self) { choice in
                                Button(action: {
                                    gameManager.chooseOption(choice)
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.black.opacity(0.6))
                                            .frame(width: 370, height: 90)
                                            .overlay(
                                                Text(choice)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                    .shadow(radius: 2)
                                                    .frame(width: 340, height: 80)
                                                    .multilineTextAlignment(.center)
                                                    .padding(.horizontal, 20)


                                            )
                                    }
                                }
//                                .frame(width: 370, height: 65)
                            }
                        }
                        .padding(.top, -40) // Move buttons up on the screen

//                        .padding(.leading, 11)
                    } else {
                        Text("No Story Found")
                            .foregroundColor(.red)
                            .font(.title)
                            .bold()
                    }
                }

                Spacer()

                // ✅ Restored BottomView for Story Text
                if !gameManager.isGameOver,
                    let character = gameManager.selectedCharacter,
                   let storyText = gameManager.story[character]?[gameManager.currentStoryNode]?.text {
                    let storyText = String(storyText.prefix(95)) + " ... Expand Text" // ✅ Show first 80 characters

                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.black.opacity(0.6))
                        .frame(width: 370, height: 150)
                        .overlay(
                            Text(storyText)
                                .font(.system(size: 20)).bold()
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                                .padding()
                                .multilineTextAlignment(.center)
                        )
                        .onTapGesture {
                            isBottomSheetVisible = true
                        }
                        .padding(.bottom, 150) //moves the story up
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
        gameManager.isGameOver = false // Hide "YOU DIED" screen first

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = scene.windows.first {
                print("🎯 ScreenOne: Forcing reset to WelcomeScreen!")  // ✅ Debug navigation
                window.rootViewController = UIHostingController(rootView: WelcomeScreen().environmentObject(GameManager()))
                window.makeKeyAndVisible()
            }
        }
        
    }

}
