//
//  KnightScreen.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 2/11/25.
//


//
//  KnightScreen.swift
//  RTR Challenge 5
//
//  Created by Yousef Alsharafi on 2/9/25.
//

import SwiftUI

struct KnightScreen: View {
    var body: some View {
        VStack {
            Image("BGGI")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            VStack {
                Text("Welcome, Knight!")
                    .font(.largeTitle)
                    .padding()
                Image("Knight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .navigationTitle("Knight's Journey")
            
            
            
        }
    }
}
