//
//  ViewController.swift
//  Concentration
//
//  Created by John Holland on 8/19/18.
//  Copyright © 2018 John Holland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game:Concentration = Concentration(numberOfPairsOfCards: buttons.count/2)
    private let emojis:[String] = ["👻","🎃","🐈","💀","🏮","⚡︎"]
    @IBOutlet private var flipCountLabel: UILabel!
    private var flipCount = 0
    @IBOutlet private var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCard(on: sender)
    }
    private func  flipCard(on button: UIButton){
        if  let indexOfButton = buttons.index(of: button)  {
            game.chooseCard(at: indexOfButton)
        }
        updateUI()
    }
    private func  updateUI() {
        for  indexOfButton in  buttons.indices {
            let button = buttons[indexOfButton]
            let card=game.cards[indexOfButton]
            if (card).isMatched {
                button.backgroundColor = UIColor.clear
                button.setTitle("", for: .normal)
            } else {
                if (card.isShowing) {
                    let extractedExpr: String = getSymbolForCardIndex(index: indexOfButton)
                    button.setTitle(extractedExpr, for: .normal)
                    button.backgroundColor = UIColor.white
                }
                else {
                    button.setTitle("", for: .normal)
                    button.backgroundColor = UIColor.orange
                }
            }
            
        }
        flipCount += 1
        flipCountLabel.text = "Flips: \(flipCount)"
    }
    func getSymbolForCardIndex(index:Int) ->String {
        let card = game.cards[index]
        return emojis[card.identifier]
    }
    
}

