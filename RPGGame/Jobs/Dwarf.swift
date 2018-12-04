//
//  Dwarf.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
class Dwarf : Character{
    init(name: String, classe : Classe){
        super.init(name: name, healthpoint: 20, maxHealthpoint: 20, weapon: Axe(), classe: classe)
    }
}
