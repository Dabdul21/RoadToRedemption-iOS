import SwiftUI

struct BottomView: View {
    @Binding var isVisible: Bool
    var storyText: String

    var body: some View {
        ZStack {
            VisualEffectBlur()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text(storyText)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()

                // Close Button with Haptic Feedback
                Button(action: {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                    withAnimation(.easeOut(duration: 0.3)) {
                        isVisible = false
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.red.opacity(0.9))
                        .padding()
                }
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .presentationDetents([.height(505)]) // Bottom sheet only expands halfway
    }
}

// VisualEffectBlur
struct VisualEffectBlur: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .systemMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView(isVisible: .constant(true), storyText: "This is the story text.")
    }
}
