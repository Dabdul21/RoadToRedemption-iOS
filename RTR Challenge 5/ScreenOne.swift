import SwiftUI

struct ScreenOne: View {
    @ObservedObject var gameManager: GameManager
    @State private var isBottomSheetVisible = false

    var body: some View {
        ZStack {
            Image("BackGroundImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer().frame(height: 230)

                // ✅ Ensure the character is set, otherwise show an error
                if let character = gameManager.selectedCharacter {
                    VStack(spacing: 10) {
                        if let storyNode = gameManager.story[character]?[gameManager.currentStoryNode] {
                            
                            ForEach(storyNode.choices.keys.sorted(), id: \.self) { choice in
                                if let outcome = storyNode.outcomes?[choice] {
                                    Button(action: {
                                        gameManager.selectedOutcome = outcome
                                        gameManager.showingOutcome = true
                                    }) {
                                        ZStack {
                                            Image("ButtonTemplate")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 380, height: 155)
                                            
                                            Text(choice)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .shadow(radius: 2)
                                        }
                                    }
                                    .frame(width: 300, height: 65)
                                }
                            }
                        }
                    }
                    .padding(.leading, 11)
                } else {
                    Text("Error: No Character Selected").foregroundColor(.red).bold()
                }

                Spacer()

                // ✅ Story preview inside a bottom rectangle
                if let character = gameManager.selectedCharacter,
                   let storyText = gameManager.story[character]?[gameManager.currentStoryNode]?.text {
                    
                    let previewText = String(storyText.prefix(80)) + "..." // ✅ Show first 80 characters
                    
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.black.opacity(0.7))
                        .frame(width: 370, height: 100)
                        .overlay(
                            Text(previewText)
                                .foregroundColor(.white)
                                .padding()
                                .multilineTextAlignment(.center)
                        )
                        .onTapGesture {
                            isBottomSheetVisible = true
                        }
                        .padding(.bottom, 60)
                }
            }
        }
        .sheet(isPresented: $isBottomSheetVisible) {
            BottomView(
                isVisible: $isBottomSheetVisible,
                storyText: gameManager.story[gameManager.selectedCharacter ?? ""]?[gameManager.currentStoryNode]?.text ?? "No Story Found"
            )
            .presentationDetents([.medium]) // ✅ Only opens halfway
        }
        .fullScreenCover(isPresented: $gameManager.showingOutcome) {
            if let outcome = gameManager.selectedOutcome {
                ChoiceOutcomeView(outcome: outcome, showOutcome: $gameManager.showingOutcome)
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}
