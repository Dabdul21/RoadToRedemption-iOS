//
//  RTR_Challenge_5App.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 1/23/25.
//
import SwiftUI

@main
struct RTR_Challenge_5App: App {
    @StateObject private var gameManager = GameManager()  // ✅ Initialize GameManager at the top level

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameManager)  // ✅ Pass GameManager globally
        }
    }
}
