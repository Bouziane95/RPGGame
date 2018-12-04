//
//  Colossus.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
class Colossus : Character{
    init(name: String, classe : Classe){
        super.init(name: name, healthpoint: 200, maxHealthpoint: 200, weapon: BareHand(), classe: classe)
    }
}
