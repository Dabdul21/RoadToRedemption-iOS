//
//  Options.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/27/25.
//

import SwiftUI
//jrhfvjhrfvugv
struct Options: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.red)
            .frame(width: 200, height: 50)
            .overlay(
                Text("Option 1")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
            )
        
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.red)
            .frame(width: 200, height: 50)
            .overlay(
                Text("Option 2")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
            )
        
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.red)
            .frame(width: 200, height: 50)
            .overlay(
                Text("Option 3")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
            )
    }
}

#Preview {
    Options()
}
