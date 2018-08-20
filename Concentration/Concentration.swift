//
//  Concentration.swift
//  Concentration
//
//  Created by John Holland on 8/19/18.
//  Copyright © 2018 John Holland. All rights reserved.
//

import Foundation
class Concentration {
    
   private(set) var cards:[Card] = []
    
    private var onlyCardShowingIndex : Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                    if cards[index].isShowing {
                        if (foundIndex == nil){
                            foundIndex = index
                        } else {
                            return nil //more than one showing
                        }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isShowing = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"Cocentration.chooseCard(\(index)) that is not a legal index");
        if !cards[index].isShowing {
            if let cardShowing = onlyCardShowingIndex {
                if cards[cardShowing].identifier == cards[index].identifier {
                    cards[cardShowing].isMatched = true
                    cards[index].isMatched = true
                    onlyCardShowingIndex = nil
                }
            }
            onlyCardShowingIndex = index
        }
        else {
            onlyCardShowingIndex = index
        }
        
    }
    
    
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)) can't have a game with <=0 pairs of cards")
        for _ in 0..<numberOfPairsOfCards {
            let newCard = Card()
            cards += [newCard, newCard]
            
        }
        
        cards.shuffle()
    }
}
extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<count
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
