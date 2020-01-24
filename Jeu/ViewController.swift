//
//  ViewController.swift
//  Jeu
//
//  Created by Djiva Canessane on 17/01/2020.
//  Copyright © 2020 Djiva Canessane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var playerOne: Player = Player(name: nil)
    var playerTwo: Player = Player(name: nil)
    
    var charactersP1: [Character] = []
    var charactersP2: [Character] = []
    
    func attack(atkCharacter: Character, rcvCharacter: Character, weapon: Weapon) {
        
        atkCharacter.energy = atkCharacter.energy - weapon.consumedEnergy
        rcvCharacter.life = rcvCharacter.life - weapon.damage
        
    }

    let textField: UITextField = UITextField()
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBAction func start(_ sender: Any) {
        mainLabel.text = "Enter your name player 1"
        
        
    }
    
    
    
    
}

