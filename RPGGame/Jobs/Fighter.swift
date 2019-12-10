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
    
    override func offensiveAbilitys(_ attacker: Character, _ target: Character){
        //random number that allows to check if the ability is casted
        let interval = Int.random(in: 0...10)
        
        if interval >= 6{
            switch self.classe{
            case .Fighter:
                Fighter.warriorAbility(attacker, target)
            default:
                break
            }
        }
    }
    
    static func warriorAbility(_ attacker: Character, _ target: Character){
        attacker.weapon.damages *= 2
        print("\(attacker.name) le \(attacker.classe) utilise 'Cri de Guerre !' et inglige un coup critique de \(attacker.weapon.damages) points de dégats. Il double son attaque !")
        print()
    }
    
}
