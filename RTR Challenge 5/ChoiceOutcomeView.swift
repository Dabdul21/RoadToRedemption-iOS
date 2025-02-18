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
                Image("Out") // Replace with your outcome default image name
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }

            VStack {
                Text(outcome.text)
                    .font(.system(size: 23).bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 305)
                    .cornerRadius(15)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(20)


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
        outcome: StoryOutcome(text: "This village is everything you know, and you refuse to let it fall. Gripping whatever weapon you can find, you prepare to face the coming storm—no matter the cost. The elders bark orders, rallying those willing to fight. The air is thick with tension, the weight of what’s to come settling deep in your chest.", background: "SmokingCity", death: false),
        showOutcome: .constant(false)
    )
}
