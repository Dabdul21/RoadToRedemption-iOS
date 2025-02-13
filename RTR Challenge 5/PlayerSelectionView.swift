import SwiftUI

struct PlayerSelectionView: View {
    @EnvironmentObject var gameManager: GameManager  // ✅ Use EnvironmentObject
    @State private var navigateToBackground = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("SelectBG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .offset(CGSize(width: 0, height: -10))
                
                Image("LargeScrollBG")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        Text("""
                                    Two lives intertwined by fate,
                                     yet shaped by choice.

                               Their journeys are yours to decide
                             
                                       Which path will you walk?
                             
                             
                             """)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .shadow(color: .white, radius: 0.2)
                            .frame(alignment: .center)
                    )
                    .offset(y: -215)
                    .frame(width: 360, height: 380)


                
                VStack(spacing: 95) {
                    Button(action: {
                        gameManager.selectCharacter("Aldreic") // ✅ Save selection
                        navigateToBackground = true
                    }) {
                        Image("SScroll")
                            .resizable()
                            .frame(width: 280, height: 110)
                            .overlay(
                                Text("Aldric")
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(.black)
                                    .shadow(color: .white, radius: 0.2)
                            )
                            .offset(y: 65)


                    }
                    
                    Button(action: {
                        gameManager.selectCharacter("Thane") // ✅ Save selection
                        navigateToBackground = true
                    }) {
                        Image("SScroll")
                            .resizable()
                            .frame(width: 280, height: 110)
                            .overlay(
                        
                        Text("Thane")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.black)
                            .shadow(color: .white, radius: 0.2)
                        )
                            .offset(y:-3)

                    }
                }
                .padding(.top, 80)

            }
            .navigationDestination(isPresented: $navigateToBackground) {
                CharacterBackgroundView().environmentObject(gameManager) // ✅ Fix navigation
            }
        }
    }
}

#Preview {
    PlayerSelectionView().environmentObject(GameManager())
}
