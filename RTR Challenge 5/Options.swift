//
//  Options.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/27/25.
//
import SwiftUI

struct Options: View {
    var body: some View {
        Button(action: {
            print("Button tapped!")
        }) {
            ZStack {
                Image("ButtonTemplate") // Ensure the image is in your assets first or wont load
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 125)
                
                Text("Example Text blah ") // Replace with real optionstext
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
            }
        }
        .frame(width: 300, height: 55)    }
}
#Preview {
    Options()
}
