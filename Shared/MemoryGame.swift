//MARK: MODEL, Main Logic, Main Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {

    //MARK: Basic Models
    struct Card: Identifiable {
        var isMatched = false
        var isFaceUp = false
        let content: CardContent
        let id: Int
    }



    //MARK: Make Cards array and init for it
    private(set) var cards: Array<Card>
    init(numberOfPairsOfCards: Int,createCardContent:(Int)-> CardContent){
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2+1))
        }
    }



    //MARK: Make match logic on choosing card
    // only Card index is compared with model and changed accordingly as choosen ,
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly}
        set{cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}}
    }// computed property ( get and set )


    mutating func choose(_ card: Card){
        print("card.id: \(String(describing: card.id))")//Dx
        print("chosenIndex: \(String(describing: cards.firstIndex(where: {$0.id == card.id})))")//Dx
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,!cards[chosenIndex].isMatched{
            if let potencialMatchIndex = indexOfTheOneAndOnlyFaceUpCard { //getter is called line 11 , "if let" is optional binding
                print("potencialMatchIndex: \(String(describing: potencialMatchIndex))")//Dx
                if cards[chosenIndex].content == cards[potencialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potencialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            }
            else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex //setter is called line 12
                print("indexOfTheOneAndOnlyFaceUpCard: \(String(describing: indexOfTheOneAndOnlyFaceUpCard))")//Dx
            } //if let else
        }//if let
    }//mutating func
}


//extension of Array
extension Array  {
    var oneAndOnly: Element?  {
        if self.count == 1 { return self.first} else{ return nil }
    }
}


//MARK: Permanent Data, Actions and Calculations
//Temporaty data is put in View Model




