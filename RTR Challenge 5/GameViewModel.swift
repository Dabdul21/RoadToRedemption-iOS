//
//  GameViewModel.swift
//  RTR Challenge 5
//
//  Created by Dayan Abdulla on 2/11/25.
//


import SwiftUI

class GameViewModel: ObservableObject {
    @Published var characterChoice: Character = " "
    @Published var choices: [String] = []
    @Published var narrativeText: String = "Welcome to the game! Choose your character to begin."

    func startGame(with character: Character) {
        self.characterChoice = character
        
        let characterName = (character == "K") ? "Knight" : "Thane"
        
        narrativeText = """
        You have chosen \(characterName).
        The amulet pulses in your hands as the night grows darker...
        """
    }
    
    func makeChoice(_ choice: String) {
        choices.append(choice)
        narrativeText = "You selected choice \(choice). The story unfolds..."
    }
}
