//
//  Fighter.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
class Fighter : Character{
    init(name: String, classe: Classe){
        super.init(name: name, healthpoint: 100, maxHealthpoint: 100, weapon: Sword(), classe: classe)
    }
}
