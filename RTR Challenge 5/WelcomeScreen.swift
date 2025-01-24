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
            Image("backgroundImageName") // Replace with  image asset name
                           .resizable()
                           .scaledToFill()
                           .ignoresSafeArea()
            
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray)
                    .frame(width: 200, height: 50)
                    .overlay(
                        Text("Welcome")
                            .foregroundColor(.white)
                    )
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
