//
//  Vault.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
class Vault{
    
    /*func for the vault content, it depends on the class of the attacker,
     all the random weapons are stored in array of weapons(randomWeaponsG,
     the index from 0 to 3 are warrior type weapons and index from 4 to 6 are mage type weapons*/
    
    static func randomSpawnWeapons(for hero: Character){
        //array of random weapons
        let randomWeaponsG = [Excalibur(),WoodenSword(), Spoon(), Arc(), WoodenStaff(), GandalfScepter(), ElderWand()]
        
        //pick a random number to propose a new weapon
        if hero.classe == .Wizard{
            //weapons with index 4 to 6 are for the wizard class
            let randomWeaponWizard = Int(arc4random_uniform(UInt32(3) + 3))
            Vault.vaultSpawn(randomWeapon: randomWeaponWizard, hero: hero, randomWeaponsG: randomWeaponsG)
        }else{
            //weapons with index 0 to 3 are for the others class
            let randomWeapons = Int(arc4random_uniform(UInt32(3)))
            Vault.vaultSpawn(randomWeapon: randomWeapons, hero: hero, randomWeaponsG: randomWeaponsG)
        }
    }
    
    /*func for spawning the vault, each turn this func is called after the attacker is defined, it rolls a "dice",
     from 0 to 6, if the number is above 3 the vault spawns.
     you can equip the weapon from the vault or close the vault and keep your default weapon*/
    
   static func vaultSpawn(randomWeapon: Int, hero: Character, randomWeaponsG: [Weapon]){
        //roll the dice !
        let interval = Int(arc4random_uniform(UInt32(6)))
        
        if interval > 4 {
            print("SURPRISE !! une coffre apparait. Vous trouvez une arme dedans qui est \(randomWeaponsG[randomWeapon].name)")
            print()
            let attacker = hero
            attacker.switchWeapon(attacker,from: attacker.weapon, to:
                randomWeaponsG[randomWeapon])
        }
    }
    
    
}
