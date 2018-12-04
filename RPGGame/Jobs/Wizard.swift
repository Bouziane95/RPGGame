//
//  Wizard.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
class Wizard : Character{
    init(name: String, classe : Classe){
        super.init(name: name, healthpoint: 30, maxHealthpoint: 30, weapon: Staff(), classe: classe)
    }
}
