//
//  WelcomeScreen.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/24/25.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        
        ZStack{
            Image("W") // Replace with your image asset name
                    .resizable()
                    .scaledToFill()
                    .frame(width: 459, height: 500) // Adjust width and height as needed
                    .ignoresSafeArea()
                    .offset(y: -100) // Move the image higher up on the screen
            
            //delete this once u fix img
            //also make img cleaner
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.black)
                .offset(y: 375) // Move the image higher up on the screen
                .frame(width: 500, height: 100)
            
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.red)
                    .frame(width: 200, height: 50)
                    .overlay(
                        Text("PLAY")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                    )
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
