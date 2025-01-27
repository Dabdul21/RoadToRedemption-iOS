//
//  ContentView.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Game Menu")
                .font(.title)
                .padding()

            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray)
                .frame(width: 200, height: 50)
                .overlay(
                    Text("Resume")
                        .foregroundColor(.white)
                )
                .onTapGesture {
              
                    print("Start Game button tapped")
                }

            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray)
                .frame(width: 200, height: 50)
                .overlay(
                    Text("Settings")
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    
                    print("Settings button tapped")
                }

            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray)
                .frame(width: 200, height: 50)
                .overlay(
                    Text("High Scores")
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    print("High Scores button tapped")
                }

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .frame(width: 200, height: 50)
                .overlay(
                    Text("Exit")
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    print("Exit button tapped")
                }
        }
    }
}

//
//#Preview {
//    ContentView()
//}
k
