//
//  ContentView.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/23/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject var audioManager = AudioManager.shared
    
    var body: some View {
        WelcomeScreen()
            .environmentObject(audioManager) // Pass the AudioManager
    }
}

#Preview {
    ContentView()
}
