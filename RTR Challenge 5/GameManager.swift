import SwiftUI

class GameManager: ObservableObject {
    @Published var selectedCharacter: String? = nil
    @Published var currentStoryNode: String = "start"
    @Published var showingOutcome: Bool = false
    @Published var selectedOutcome: StoryOutcome? = nil
    @Published var isGameOver: Bool = false
    @Published var story: [String: [String: StoryNode]] = [:]
    @Published var goToWelcomeScreen: Bool = false  // ✅ New state for reset navigation
    
    init() {
        loadStory()
    }
    
    func loadStory() {
        if let url = Bundle.main.url(forResource: "story", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                
                // ✅ Print raw JSON before decoding
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("📜 Raw JSON: \(jsonString)")
                }

                let decodedData = try JSONDecoder().decode([String: [String: StoryNode]].self, from: data)
                self.story = decodedData
                print("✅ Story JSON Loaded Successfully")
            } catch {
                print("❌ Error Decoding JSON: \(error.localizedDescription)")
            }
        } else {
            print("❌ story.json NOT found in the bundle")
        }
    }

    
    func selectCharacter(_ character: String) {
        selectedCharacter = character
        currentStoryNode = "start"
        isGameOver = false
    }
    
    func chooseOption(_ choice: String) {
        if let character = selectedCharacter,
           let storyNode = story[character]?[currentStoryNode],
           let nextScene = storyNode.choices[choice],
           let outcome = storyNode.outcomes?[choice] {
            
            selectedOutcome = outcome
            showingOutcome = true
            
            if outcome.death {
                isGameOver = true
                print("💀 Game Over: Player died choosing '\(choice)'")
            } else {
                if story[character]?[nextScene] != nil {
                    print("✅ Moving to Scene: \(nextScene)")  // ✅ Debugging log
                    currentStoryNode = nextScene
                } else {
                    print("❌ ERROR: Scene '\(nextScene)' not found in JSON!")
                }
            }
        } else {
            print("❌ ERROR: Invalid choice '\(choice)' at node '\(currentStoryNode)'")
        }
    }
    
    
    
    func resetGame() {
        print("🔄 Game Reset Triggered!")  // ✅ Log reset call
        selectedCharacter = nil
        currentStoryNode = "start"
        showingOutcome = false
        selectedOutcome = nil
        isGameOver = false
        goToWelcomeScreen = true  // ✅ Signal navigation reset
        loadStory()
        print("✅ GameManager: goToWelcomeScreen = \(goToWelcomeScreen)")  // ✅ Log the flag
    }



}
    
    struct StoryNode: Codable {
        let text: String
        let choices: [String: String]
        let outcomes: [String: StoryOutcome]?
    }
    
    struct StoryOutcome: Codable {
        let text: String
        let background: String
        var death: Bool = false
    }

