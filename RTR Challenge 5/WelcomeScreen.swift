//
//  WelcomeScreen.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/24/25.
//


//add background music

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationStack{
        ZStack{
            Image("NewBG") // Replace with your image asset name or it wont show img
                    .resizable()
                    .scaledToFill()
                    .frame(width: 459, height: 500) // Adjust width and height as needed later
                    .ignoresSafeArea()
                    .offset(y: -130) // Move the image higher up on the screen
            
            //delete this once u fix img
            //also make img cleaner
            //ONLY TEMP DELEYE THIS
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.black)
                .offset(y: 490) // Move the image higher up on the screen
                .frame(width: 500, height: 250)
            
            VStack{
                NavigationLink{
                    ScreenOne()
                } label:{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.black)
                        .frame(width: 200, height: 50)
                        .overlay(
                            Text("PLAY")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                        )
                    }
                .isDetailLink(false) // Disables the default back button behavior (DONT REMOVE UNLESS U WANT A BACKBUTTON ON SCREEN ONE)
                }
            }
        }
    }
}


#Preview {
    WelcomeScreen()
}
