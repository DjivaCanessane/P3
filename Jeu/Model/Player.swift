//
//  Player.swift
//  Jeu
//
//  Created by Djiva Canessane on 17/01/2020.
//  Copyright © 2020 Djiva Canessane. All rights reserved.
//

import Foundation

class Player{
    var name:String?
    var warriors: [Warrior]
    
    init(name: String?, warriors: [Warrior]) {
        self.name = name
        self.warriors = warriors
    }
}
