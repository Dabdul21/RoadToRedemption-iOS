//
//  ScreenOne.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/27/25.
import SwiftUI

struct ScreenOne: View {
    @State private var isBottomSheetVisible = false
    
    
//    @State private var selectedText = "" // Holds the var for the text for BottomView later when logic made


    var body: some View {
        ZStack {
            // Background Image
            Image("BackGroundImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer().frame(height: 230) // Adds limited space on top by pushing buttons down (DONT DELETE)

                // Option Buttons
                VStack(spacing: 10) {
                    Options()
                        .frame(width: 390, height: 80)
                        .cornerRadius(5)

                    Options()
                        .frame(width: 370, height: 80)
                        .cornerRadius(10)

                    Options()
                        .frame(width: 370, height: 80)
                        .cornerRadius(10)
                }
                .padding(.leading, 11) //CENTERS BUTTONS and ROUNDED RECTANGLE

                Spacer() // Pushes Rounded Rectangle to the bottom (DONT REMOVE)

                // Rounded Rectangle Button/ BottomView
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.black.opacity(0.7)) // Semi-transparent background
                    .frame(width: 370, height: 295)
                    .overlay(
                        Text("Blah blah, cick & read more..") // just placeholder text later put array here
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                    )
                    .onTapGesture {
                        isBottomSheetVisible = true // Open BottomView "the drop down"  when tapped
                    }
                    .padding(.bottom, 60) // Adjusts the spacing from bottom (DONT REMOVE)
            }
        }
        .sheet(isPresented: $isBottomSheetVisible) {
            BottomView(isVisible: $isBottomSheetVisible) //, selectedText: selectedText goes inside when logic is made so it shows the story
        }
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    ScreenOne()
}
