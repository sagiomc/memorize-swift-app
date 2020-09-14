//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Christian Santiago on 12/09/20.
//  Copyright © 2020 Hades. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let totalPairs = Int.random(in: 2...5)
        let emojis = ["👻", "🎃", "🕷", "💀", "🧟‍♂️"]
        return MemoryGame<String>(numberOfPairsOfCards: totalPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
    
}
