////
////  Options.swift
////  RTR Challenge 5
////
////  Created by Dayan Abdulla on 1/27/25.
////
//import SwiftUI
//
//struct Options: View {
//    let choiceText: String
//    let outcome: ChoiceOutcome
//    @Binding var showOutcome: Bool
//    @Binding var selectedOutcome: ChoiceOutcome?
//
//    var body: some View {
//        Button(action: {
//            selectedOutcome = outcome
//            showOutcome = true
//        }) {
//            ZStack {
//                Image("ButtonTemplate")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 380, height: 125)
//
//                Text(choiceText)
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .shadow(radius: 2)
//            }
//        }
//        .frame(width: 300, height: 55)
//    }
//}
