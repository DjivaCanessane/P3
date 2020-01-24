//
//  Weapon.swift
//  Jeu
//
//  Created by Djiva Canessane on 17/01/2020.
//  Copyright © 2020 Djiva Canessane. All rights reserved.
//

import Foundation

class Weapon {
    var damage: Int
    var type: String
    var consumedEnergy: Int
    
    init(damage: Int, type: String, consumedEnergy: Int) {
        self.damage = damage
        self.type = type
        self.consumedEnergy = consumedEnergy
    }
    
}
