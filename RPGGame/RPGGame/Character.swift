//
//  Character.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
class Character {
    var name : String
    var classe : Classe
    var healthpoint: Int
    var maxHealthpoint: Int
    var weapon : Weapon
    
    init(name: String, healthpoint: Int, maxHealthpoint: Int, weapon: Weapon, classe: Classe){
        
        self.name = name
        self.healthpoint = healthpoint
        self.maxHealthpoint = maxHealthpoint
        self.weapon = weapon
        self.classe = classe
        
        switch self.classe{
        case .Fighter:
            self.weapon = Sword()
            self.healthpoint = 100
        case .Colossus:
            self.weapon = BareHand()
            self.healthpoint = 200
        case .Wizard:
            self.weapon = Staff()
            self.healthpoint = 30
        case .Dwarf:
            self.weapon = Axe()
            self.healthpoint = 20
        }
}
