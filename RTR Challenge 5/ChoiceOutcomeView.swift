import SwiftUI

struct ChoiceOutcomeView: View {
    let outcome: ChoiceOutcome
    @Binding var showOutcome: Bool

    var body: some View {
        ZStack {
            Image("W")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text(outcome.text)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding()
            }
        }
        .onTapGesture {
            showOutcome = false
        }
    }
}
