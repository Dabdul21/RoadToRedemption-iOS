import SwiftUI

struct ChoiceOutcomeView: View {
    let outcome: StoryOutcome
    @Binding var showOutcome: Bool

    var body: some View {
        ZStack {
            // Check if the image exists, otherwise use a default
            if let uiImage = UIImage(named: outcome.background), !outcome.background.isEmpty {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                Image("OutcomeBG") // Replace with your default image name
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }

            VStack {
                Text(outcome.text)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(15)
            }
        }
        .contentShape(Rectangle()) // Ensures the whole screen is tappable
        .onTapGesture {
            showOutcome = false
        }
    }
}

#Preview {
    ChoiceOutcomeView(
        outcome: StoryOutcome(text: "Sample Outcome", background: "", death: false),
        showOutcome: .constant(false)
    )
}
