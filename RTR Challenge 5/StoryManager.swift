import SwiftUI

struct Decision {
    let id: Int
    let text: String
    let consequences: [String: (nextID: Int, output: String)]
}

class StoryManager: ObservableObject {
    @Published var currentDecision: Decision
    @Published var outputText: String = ""
    @Published var showOutput: Bool = false
    @Published var selectedChoice: String? = nil

    private var decisions: [Int: Decision] = [
        1: Decision(
            id: 1,
            text: "On a quiet day, you have free time in the village of Valleys. You can either spend it preparing for the unknown or enjoying quality time with your best friend.",
            consequences: [
                "1. Help repair farm tools, improving their design for the villagers." : (2,"You become known as a helpful tinkerer, gaining the villagers’ fondness."),
                "2.Study old scrolls borrowed from a wandering scholar." : (2,"You develop an early thirst for knowledge, shaping your future as an intellectual."),
                "3. Accompany Aldric on a small hunting trip, offering logical tips on tracking." : (2,"Thane’s intellect and curiosity are established before the coming storm.")
            ]
        ),
        2: Decision(
            id: 2,
            text: "Raiders approach Valleys, and panic spreads among the villagers. While Aldric prepares to fight, you weigh your options.",
            consequences: [
                "1. Stay and assist Aldric, hoping strategy can complement bravery." : (3,"You fight reluctantly, getting injured along the way, but Aldric seems more confident when he sees you at his side."),
                "2. Organize an evacuation of as many villagers as possible." : (3,"You're relieved to ensure a large group of villagers escapes, but you can't help but worry if you made the wrong choice leavind Aldric behind."),
                "3. Hide in the forest with a small group, hoping the raiders will pass quickly." : (3,"    * You are safer here, but you almost feel even more afraid. You wonder if you're really this powerless in a crisis. No matter which he chooses, Thane survives but leaves with emotional scars.")
            ]
        ),
        3: Decision(
            id: 3,
            text: "As you and other survivors flee, knights from Illicity ride past toward Valleys.",
            consequences: [
                "1. Yell at the knights to hurry and save the village." : (4,"The knights notice your desperation, but they pass by without acknowledging you. You're struck with the feeling that, as a lowly commoner, you don't really matter to them."),
                "2. Wave silently, trusting they will do their duty." :(4,"Overwhelmed, you stifle your emotions and hope that they arrive in time to help Aldric."),
                "3. (Red) Try to stop the knights, demanding they take more refugees with them." :(4, "Your usually rational mind is overcome with emotion, and you leap in front of the oncoming knights without thinking. In your desperation, you gravely misjudge how fast those horses are moving. The knights don't have enough time to react to your sudden move and, already wounded & weak, you're mortally wounded in the collision.")
            ]
        ),
        4: Decision(
            id: 4,
            text: "Led away from the chaos, you've been brought to Illicity as a refugee. You and the other vulnerable villagers are assigned to the slums, where you face prejudice from the noble people and live in poor conditions.",
            consequences: [
                "1. (Red) Attempt to blend in, minimizing conflict to secure shelter for the refugees." : (5,""),
                "2. Advocate loudly for better conditions, risking blowback from the nobles." : (5,""),
                "3. Protest at the city gates, publicly shaming the nobles for neglecting their refugees." : (5, "")
            ]
        ),
        5: Decision(
            id: 5,
            text: "Food is scarce, and local gangs exploit refugees. Your logical mind might save lives—or cost them.",
            consequences: [
                "1. Negotiate with a local gang, trading minor services for protection." : (6,""),
                "2. Gather the refugees, creating a communal support system." : (6,""),
                "3. Isolate himself, avoiding gang or community ties to stay focused on a plan of escape": (6 ,"")
            ]
        ),
        6: Decision(
            id: 6,
            text: "You meet a man named Dahmari, a sickly but knowledgeable plague doctor. Dahmari admits to you that his practice has shunned by the nobility, leaving him in the slums.",
            consequences: [
                "1. Show empathy, sharing stories of Valleys and hardships." : (7, ""),
                "2. Keep it strictly professional, focusing on how to find cures." : (7,""),
                "3. (Red) Be wary- The rumors, if true, do make Dahmari’s methods seem suspicious." :( 7,"")//This button should be red
            ]
        ),
        7: Decision(
            id: 7,
            text: "After weeks of trial and error, you and Dahmari stumble on a temporary treatment that reduces symptoms of The Crave.",
            consequences: [
                "1. Share it immediately with the slum dwellers to save as many as possible." : (8,""),
                "2. Contact the nobles, hoping for funding and distribution support." : (8,""),
                "3. Keep it under wraps, trying to perfect it before distributing it to everyone." : (8, "")
            ]
        ),
        8: Decision(
            id: 8,
            text: "With cases rising, both the slum dwellers and the city officials pressure you and Dahmari for exclusive use of the cure. Each side wants control over it.",
            consequences: [
                "1. Provide small doses to both slum dwellers and the nobles." : (9,""),
                "2. Prioritize the slums, ignoring the noble's demands." : (9,""),
                "3. Negotiate with the nobles, seeking protection and money." : (9,"")
            ]
        ),
        9: Decision(
            id: 9,
            text: "News of the cure reaches high-ranking figures who \"invite\" (more like coerce) you and Dahmari into the castle labs.",
            consequences: [
                "1. Accept, moving to the castle to work under noble oversight." : (10, "You enter the castle, your work now shadowed by noble influence."),
                "2. Decline, staying in the slums to remain independent." : (10, "You maintain your freedom, but resources remain scarce."),
                "3. Demand equal rights for the poor before agreeing to any move." : (10, "Your bold stance sparks tension with the nobles, yet gains respect among the poor.")
            ]
        ),
        10: Decision(
            id: 10,
            text: "You hear rumors that Aldric, now a knight, may be part of the noble guard. You wonder if your paths might cross again.",
            consequences: [
                "1. Seek Aldric out- noble or not, he was once your best friend." : (11, "You find Aldric, memories of your bond surfacing despite the distance."),
                "2. Avoid Aldric, refusing to trust him now that he's joined your oppressors." : (11, "You distance yourself from Aldric, burying the past beneath suspicion."),
                "3. Spread rumors that Aldric is no friend to the commoners, discrediting him." : (11, "Your words stir doubt about Aldric, fracturing his reputation among the people.")
            ]
        ),
        11: Decision(
            id: 11,
            text: "Without you to keep him sharp and rational, it seems Aldric has been manipulated by the nobles. You return to the lab one day to find it destroyed, Dahmari gone, and your old friend's now unfamiliar face in the chaos.",
            consequences: [
                "1. Mourn Dahmari quietly, taking responsibility for leaving." : (12, "Grief weighs on you, fueling your determination to continue Dahmari's work."),
                "2. Curse Aldric and the nobles, vowing revenge." : (12, "Hatred sharpens your resolve, your heart hardened by betrayal."),
                "3. Try to find out what happened, asking any witness you can find what they saw." : (12, "Clues from witnesses piece together a story of conflict and conspiracy.")
            ]
        ),
        12: Decision(
            id: 12,
            text: "You salvage what you can of Dahmari’s notes, determined to finish the cure. Time is short; The Crave is spreading faster than ever.",
            consequences: [
                "1. Double down on research in the ruined lab, barely sleeping or eating." : (13, "Exhaustion grips you, but breakthroughs emerge amidst the chaos."),
                "2. Seek help from other healers or scholars." : (13, "Alliances with other minds offer new insights and hope."),
                "3. (Red) Consider extreme methods, testing incomplete formulas on humans." : (13, "Desperation leads to moral compromise, the cost etched into your conscience.")
            ]
        ),
        13: Decision(
            id: 13,
            text: "Finally, you've succeeded in creating a permanent cure for The Crave. Now, what will you do with it?",
            consequences: [
                "1. Cure Illicity, openly offering it to all, including the nobles." : (14, "Your altruism brings healing, though not without political consequences."),
                "2. (Red) Hoard the cure, saving it for yourself and those you trust." : (14, "Secrecy ensures survival for your circle, but sows seeds of future conflict."),
                "3. Keep it secret for now, selectively curing his own people in the slums." : (14, "The slums thrive under your hidden aid, yet whispers of inequality grow.")
            ]
        ),
        14: Decision(
            id: 14,
            text: "Aldric has finally discovered that the nobles manipulated him leading up to the raid, and you hear that he's trying to reach you. You must decide whether to give him a chance to explain.",
            consequences: [
                "1. Refuse to see Aldric, you're still too angry to speak." : (15, "Silence deepens the rift between you, each word unsaid a barrier."),
                "2. Meet him in private, you at least want to hear his side of the story." : (15, "Old emotions stir as Aldric's words reveal hidden truths."),
                "3. Publicly confront him, exposing his alleged betrayal to everyone." : (15, "The confrontation ignites public discourse, Aldric's reputation teetering.")
            ]
        ),
        15: Decision(
            id: 15,
            text: "With the permanent cure in hand, you face the final crossroads. The nobles are weakened by The Crave, Aldric might stand either with them or against them, and the city’s fate depends on your decision. Now, you must choose your fate.",
            consequences: [
                "1. Join forces with Aldric, overthrow the corrupt nobles, and cure Illicity." : (1, "Together with Aldric, you usher in a new era for Illicity."),
                "2. Exact vengeance- rescue only the slums and let the nobles die, then leaving Illicity to crumble." : (1, "Vengeance fulfills your sense of justice, but the city's ashes are your legacy."),
                "3. Abandon the city altogether, having cured yourself and those you deem worthy." : (1, "You leave Illicity behind, its fate a distant echo in your journey.")
            ]
        )
    ]


    init() {
        self.currentDecision = decisions[1]!
    }

    func makeChoice(_ choice: String) {
        if let result = currentDecision.consequences[choice] {
            outputText = result.output
            showOutput = true
            selectedChoice = choice
        }
    }

    func continueToNextDecision() {
        if let choice = selectedChoice, let result = currentDecision.consequences[choice], let nextDecision = decisions[result.nextID] {
            currentDecision = nextDecision
            showOutput = false
            selectedChoice = nil
        }
    }
}

