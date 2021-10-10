import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    var cards: Array<Card>{model.cards}
    typealias Card = MemoryGame<String>.Card
    @Published private var model = createMemoryGame()

    private static  let emojis:[String] = ["🎠","🎡","🎢","🚃","🚞","🚂","🚋","🚝","🚄","🚅","🚆","🚇","🚈","🚉","🚊","🚌","🚍","🚎","🚐","🚑","🚒","🚓","🚔","🚨","🚕","🚘","🚙","🚚","🚛","🚜","🚲"]

    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 15)
            {pairIndex in emojis[pairIndex]}
    }

    //MARK: User intends
    func choose(_ card: Card){
        model.choose(card)
    }

}
//MARK: Temporary Data, Actions and Calculations
// Action: choose -> model ->  createMemoryGame() -> MemoryGame<String>
