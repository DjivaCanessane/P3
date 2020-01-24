//
//  Character.swift
//  Jeu
//
//  Created by Djiva Canessane on 17/01/2020.
//  Copyright © 2020 Djiva Canessane. All rights reserved.
//

import Foundation

class Character{
    var name: String
    var weapon: Weapon
    var life: Int = 100
    var energy: Int = 100
    
    init(name :String, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
}
