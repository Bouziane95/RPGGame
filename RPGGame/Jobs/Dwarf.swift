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
    
    override func defensiveAbilitys(_ target: Character, _ attacker: Character){
        //random number that allows to check if the ability is casted
        let interval = Int.random(in: 0...10)
        
        if interval >= 6{
            switch self.classe{
            case .Dwarf:
                Dwarf.dwarfAbility(target, attacker)
            default:
                break
            }
        }
    }
    static func dwarfAbility(_ target: Character, _ attacker: Character){
        attacker.weapon.damages -= 10
        if attacker.weapon.damages < 0{
            attacker.weapon.damages = 0
        }
        print("\(target.name) le \(target.classe) utilise sa compétence 'Peau de fer'. Il réduit de 10 points les dommages et reçoit donc \(attacker.weapon.damages) points de dégats.")
        print()
    }
}
