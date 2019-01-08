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
    
    override func defensiveAbilitys(_ target: Character, _ attacker: Character){
        //random number that allows to check if the ability is casted
        let interval = Int.random(in: 0...10)
        
        if interval >= 6{
            switch self.classe{
            case .Colossus:
                Colossus.colossusAbility(target, attacker)
            default:
                break
            }
        }
    }
    static func colossusAbility(_ target: Character, _ attacker: Character){
        attacker.weapon.damages = 0
        print("\(target.name) le \(target.classe) utilise 'Mur de Fer !' et bloque l'attaque. Il ne reçoit aucun dégats !")
        print()
        
    }
}
