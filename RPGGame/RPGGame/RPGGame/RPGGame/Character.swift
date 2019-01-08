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
    let classe : Classe
    var healthpoint: Int
    let maxHealthpoint: Int
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

    func isDead() -> Bool{
        return healthpoint <= 0
    }
    
    
    func attack(from attacker: Character, on target: Character, of ennemyPlayer: Player){
        if attacker.healthpoint >= 0 || target.healthpoint >= 0{
            offensiveAbilitys(attacker, target)
            defensiveAbilitys(target, attacker)
        }
        if target.healthpoint <= 0{
            print("Vous avez attaquer un cadavre, cela n'a servit à rien !")
        }
        
        target.healthpoint -= attacker.weapon.damages
        //Check if the char has less than 0HP
        if target.healthpoint <= 0{
            target.healthpoint = 0
            print("\(target.name) est KO")
        }else{
            print("\(attacker.name) fait \(attacker.weapon.damages) point de dommages à \(target.name) et il lui reste \(target.healthpoint) points de vie.")
        }
    }
    
    func heal(from attacker: Character, on target: Character){
        //check if the char is dead or not
        if target.healthpoint <= 0{
            print("Impossible de soigner un personnage mort.")
        } else{
            target.healthpoint += attacker.weapon.damages
            //cant heal out of the initial health
            if target.healthpoint > target.maxHealthpoint{
                target.healthpoint = target.maxHealthpoint
            }
            
            print("\(attacker.name) soigne \(target.name) de \(attacker.weapon.damages) points de vie. \(target.name) a maintenant \(target.healthpoint) point de vie.")
            print()
        }
}

    func switchWeapon(_ hero: Character, from classWeapon : Weapon, to randomWeaponsG: Weapon){
        hero.weapon = randomWeaponsG
        hero.weapon.damages = randomWeaponsG.damages
        
        if self.classe == .Wizard{
            print("Vous vous équipez de \(randomWeaponsG.name) et vous soignez \(randomWeaponsG.damages) points de vie.")
        }else{
            print("Vous vous équipez de \(randomWeaponsG.name) et vous faites \(randomWeaponsG.damages) points de dommage.")
        }
}

    //The following functions is for the different class ability
    func offensiveAbilitys(_ attacker: Character, _ target: Character){
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
    
    func defensiveAbilitys(_ target: Character, _ attacker: Character){
        //random number that allows to check if the ability is casted
        let interval = Int.random(in: 0...10)
        
        if interval >= 6{
            Colossus.colossusAbility(target, attacker)
            Wizard.wizardAbility(target, attacker)
            Dwarf.dwarfAbility(target, attacker)
        }
    }
    
    //function to reset attackers damage at the end of the turn, to prevents them to keep the buffed damages
    public func characterAttackReset(){
        weapon.damages = weapon.defaultDamageValue
    }
}
