import SwiftUI

struct StoryNode: Codable {
    let text: String
    let choices: [String: String]
    let outcomes: [String: ChoiceOutcome]?
}

struct ChoiceOutcome: Codable {
    let text: String
    let background: String
}

class GameManager: ObservableObject {
    @Published var selectedCharacter: String? = nil
    @Published var currentStoryNode: String = "start"
    @Published var selectedOutcome: ChoiceOutcome? = nil
    @Published var showingOutcome = false

    var story: [String: [String: StoryNode]] = [:]

    init() {
        loadStory()
    }

    func loadStory() {
        if let url = Bundle.main.url(forResource: "story", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decodedStory = try? JSONDecoder().decode([String: [String: StoryNode]].self, from: data) {
            story = decodedStory
        } else {
            print("Failed to load story.json")
        }
    }

    func selectCharacter(_ character: String) {
        selectedCharacter = character
        currentStoryNode = "start"
    }

    func makeChoice(_ choice: String) {
        if let character = selectedCharacter,
           let node = story[character]?[currentStoryNode],
           let outcome = node.outcomes?[choice] {
            selectedOutcome = outcome
            showingOutcome = true
        }
    }

    func proceedToNextScreen() {
        showingOutcome = false
    }
}
