//
//  GameOver.swift
//  RTR Challenge 5
//
//  Created by Ahmed Alqadhi on 2/10/25.
//


//
//  GameOver.swift
//  RTR Challenge 5
//
//  Created by Ahmed Alqadhi on 2/4/25.
//

import SwiftUI

struct GameOver: View {
    var body: some View {
        ZStack {
            Image(.gameover)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
            
            VStack {
                Spacer()
                
                VStack(spacing: 15) {
                    Button("Retry") {
                        //  (add logic here)
                        print("Retry tapped")
                    }
                    .frame(width: 150, height: 50)
                    .background(Color.blue.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("Main Menu") {
                        // (add logic here)
                        print("Main Menu tapped")
                    }
                    .frame(width: 150, height: 50)
                    .background(Color.gray.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    GameOver()
}



