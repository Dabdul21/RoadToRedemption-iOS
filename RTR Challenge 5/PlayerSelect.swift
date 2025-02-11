
import SwiftUI
struct PlayerSelect: View {
    @StateObject var gameVM = GameViewModel()
    @State private var isBottomSheetVisible = false
    
    var body: some View {
        ZStack {
            Image("BackGroundImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.black.opacity(0.7))
                    .frame(width: 370, height: 295)
                    .overlay(
                        Text(gameVM.narrativeText)
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                    )
    
                    }
                    .padding(.bottom, 30)
            
        }
    }
}

#Preview {
    PlayerSelect()
}
