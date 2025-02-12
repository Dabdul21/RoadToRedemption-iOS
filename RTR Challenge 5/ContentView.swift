//
//  ContentView.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var audioManager = AudioManager.shared

    @EnvironmentObject var gameManager: GameManager  // ✅ Expect GameManager as an EnvironmentObject

    var body: some View {
        WelcomeScreen()
            .environmentObject(gameManager)  // ✅ Pass GameManager to WelcomeScreen
    }
}

#Preview {
    ContentView().environmentObject(GameManager())  // ✅ Ensure preview works
}
