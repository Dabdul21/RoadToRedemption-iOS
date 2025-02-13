import SwiftUI

struct ChoiceOutcomeView: View {
    let outcome: StoryOutcome  // ✅ Now it should be recognized
    @Binding var showOutcome: Bool

    var body: some View {
        ZStack {
            Image(outcome.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text(outcome.text)
                    .font(.custom("STFangsong", size: 22))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)

                Button("Continue") {
                    showOutcome = false
                }
                .font(.title2)
                .padding()
                .frame(width: 200)
                .background(Color.white.opacity(0.8))
                .foregroundColor(.black)
                .cornerRadius(15)
                .shadow(radius: 8)
            }
        }
    }
}

#Preview {
    ChoiceOutcomeView(
        outcome: StoryOutcome(text: "Sample Outcome", background: "default.jpg", death: false),
        showOutcome: .constant(false)
    )
}
