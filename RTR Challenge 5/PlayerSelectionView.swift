import SwiftUI

struct PlayerSelectionView: View {
    @EnvironmentObject var gameManager: GameManager  // ✅ Use EnvironmentObject
    @State private var navigateToBackground = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("GB")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .offset(CGSize(width: 0, height: -10))
                
                
                Image("ScrollOut")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 650, height: 630)
                    .offset(CGSize(width: 0, height: 150))


                    .overlay(
                        Text("""
                                Two lives intertwined by fate,
                                        yet shaped by choice.

                                Their journeys are yours to 
                                                    decide
                             
                             
                                    Which path will you walk?
                             
                             
                             """)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black)
                            .shadow(color: .white, radius: 0.2)
                            .frame(alignment: .center)
                            .offset(y: 55)
//                            .padding(.bottom, 0)


                    )
                    .offset(y: -195)
                    .frame(width: 360, height: 100)


                
                VStack(spacing: 25) {
                    Button(action: {
                        gameManager.selectCharacter("Aldreic") // ✅ Save selection
                        navigateToBackground = true
                    }) {
                        Image("PlayerButton")
                            .resizable()
                            .frame(width: 200, height: 70)

                            .overlay(
                                Text("ALDRIC")
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(.black)
                                    .shadow(color: .white, radius: 0.2)
                            )
                            .offset(y: 5)
//                            .border(Color.black, width: 10)


                    }
                    
                    Button(action: {
                        gameManager.selectCharacter("Thane") // ✅ Save selection
                        navigateToBackground = true
                    }) {
                        Image("PlayerButton")
                            .resizable()
                            .frame(width: 200, height: 70)
                            .overlay(
                        
                        Text("THANE")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.black)
                            .shadow(color: .white, radius: 0.2)
                        )
                            .offset(y:-3)
//                            .border(Color.black, width: 10)

                    }
                }
                .padding(.top, 100)

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
