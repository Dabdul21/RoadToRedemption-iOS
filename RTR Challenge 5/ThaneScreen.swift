//
//  ThaneScreen.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 2/11/25.
//


import SwiftUI
struct ThaneScreen: View {
    @StateObject private var storyManager = StoryManager()

    var body: some View {
        ZStack {
            Image("BackGroundImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()
                    .frame(height: 20)

                VStack(spacing: 20) {
                    if storyManager.showOutput {
                        Text(storyManager.outputText)
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(15)
                            .padding(.horizontal)

                        Button("Continue") {
                            storyManager.continueToNextDecision()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    } else {
                        Text(storyManager.currentDecision.text)
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(15)
                            .padding(.horizontal)

                        ForEach(storyManager.currentDecision.consequences.keys.sorted(), id: \.self) { choice in
                            Button(action: {
                                storyManager.makeChoice(choice)
                            }) {
                                ZStack {
                                    Image("ButtonTemplate")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)

                                    Text(choice)
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                        .padding()
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Thane's Journey")
    }
}
