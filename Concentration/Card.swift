//
//  Card.swift
//  Concentration
//
//  Created by John Holland on 8/19/18.
//  Copyright © 2018 John Holland. All rights reserved.
//

import Foundation
struct Card {
    private static var identifier = -1
     var isMatched = false
     var identifier : Int
    var isShowing = false
    
    private static func getIdentifier()->Int {
        identifier += 1
        return identifier
    }
    init(){
        self.identifier = Card.getIdentifier()
    }
    
}
