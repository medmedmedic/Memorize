// MARK: @main

import SwiftUI

@main
struct MemorizeApp: App {
    
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}


// MARK: Notes
// "game": immutable contant pointer to -> EmojiMemoryGame() object instant which is mutable
// "EmojiMemoryGame()": Object instance which is from View-Model
// "@main": entry point of app
