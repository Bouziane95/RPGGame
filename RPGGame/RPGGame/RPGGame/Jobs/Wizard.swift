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
    override func defensiveAbilitys(_ target: Character, _ attacker: Character){
        //random number that allows to check if the ability is casted
        let interval = Int.random(in: 0...10)
        
        if interval >= 6{
            switch self.classe{
            case .Wizard:
                Wizard.wizardAbility(target, attacker)
            default:
                break
                }
            }
        }
            
    static func wizardAbility(_ target: Character, _ attacker: Character){
        attacker.weapon.damages -= 5
        //To avoid negative damages wich can heal the wizard and go out of his maxHP
        if attacker.weapon.damages < 0{
            attacker.weapon.damages = 0
        }
        print("\(target.name) le \(target.classe) utilise 'Paix !' et diminue de 5 les points de dommages de son assailant !")
        print()
    }

}
