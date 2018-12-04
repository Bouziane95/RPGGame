//
//  Weapon.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
class Weapon {
    var damages : Int
    var name : String
    var defaultDamageValue: Int
    
    init(damages: Int, name : String, defaultDamageValue: Int){
        self.damages = damages
        self.name = name
        self.defaultDamageValue = defaultDamageValue
    }
}
