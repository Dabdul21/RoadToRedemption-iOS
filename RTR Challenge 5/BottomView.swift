//
//  BottomView.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/30/25.
import SwiftUI

struct BottomView: View {
    @Binding var isVisible: Bool
    @State private var textSize: CGFloat = 16 // Default text size

    var body: some View {
        ZStack {
            // Blurred Background (behind the bottom sheet)
            VisualEffectBlur()
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Read More Text
                Text("Read More..")
                    .font(.system(size: textSize, weight: .bold))
                    .foregroundColor(.white) // Slightly transparent white

                    .padding()

                Spacer() // Pushes the close button down

                // Close Button (Now an "X" Icon with Vibration)
                Button(action: {
                    // Add Haptic Feedback (Vibration)
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()

                    withAnimation(.easeOut(duration: 0.3)) { // Smooth fade-out effect
                        isVisible = false // Dismiss the BottomView
                    }
                }) {
                    Image(systemName: "xmark.circle.fill") // "X" icon
                        .font(.system(size: 30))
                        .foregroundColor(.red.opacity(0.9)) // Slightly transparent white
                        .padding()
                }
                .padding(.bottom, 20) // Adds spacing from bottom
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.black)
            .presentationDetents([.medium]) // Only allows medium detent
            .onChange(of: isVisible) {
                withAnimation {
                    textSize = isVisible ? 16 : 22 // Dynamically adjusts text size
                }
            }
            .onAppear {
                textSize = 16 // Resets text size when opened
            }
        }
    }
}

// Blurred Background Effect
struct VisualEffectBlur: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .systemMaterialDark) // Adjust blur style if needed
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView(isVisible: .constant(true))
    }
}
