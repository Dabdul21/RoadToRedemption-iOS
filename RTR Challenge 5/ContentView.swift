//
//  ContentView.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/23/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject var audioManager = AudioManager.shared
    @StateObject var gameManager = GameManager() // Create a single instance

    
    var body: some View {
        WelcomeScreen()
            .environmentObject(audioManager) // Pass the AudioManager
            .environmentObject(gameManager) // Pass GameManager globally
        

    }
}

#Preview {
    ContentView()
        .environmentObject(GameManager()) // ✅ Fix missing GameManager for preview

}
