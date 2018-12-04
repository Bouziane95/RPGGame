//
//  Player.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
class Player{
    //number ID to identify the player
    var id : Int
    //name of the player
    var name = ""
    var playerTeam = [Character]()
    
    init(id: Int){
        self.id = id
    }
    
    public func keyInput() -> Int{
        let input = readLine()
        let number = input!
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        if number.rangeOfCharacter(from: numberCharacters) == nil {
            return Int(number)!
        } else {
            print("Veuillez entrer un chiffre")
            return 0
        }
    }
    
    // ///////////////////
    // MARK: NAME       //
    // //////////////////
    
    // func to enter the player name
    public func getPlayerName(){
        print("Entrez le nom du joueur \(self.id)")
        print()
        if let playerName = readLine(){
            self.name = playerName //player.name = playername
        }
    }
    
    //func to sum up the number and the name of the char
    func nameChar(index : Int) -> String{
        print("\(self.name), Quel est le nom du combattant n°\(index)?")
        print()
        var name = ""
        if let nameChar = readLine(){
            name = nameChar
            print("Ok votre héros n°\(index) s'appelle \(nameChar)")
            print()
        }
        return name
}

    // ///////////////////
    // MARK: CREATION TEAM//
    // //////////////////
    
    //func to show the carac of each job to make a choice
    func caracteristicClass() -> Int{
        print("Quelle est la classe de votre personnage ? (Tapez 1,2,3 ou 4)")
        print()
        print("1. Guerrier, HP : 100, Arme : Epée, Dégats : 10 points ")
        print()
        print("2. Colosse, HP : 200, Arme : Main nues, Dégats : 5 points ")
        print()
        print("3. Mage, HP : 30, Arme : Sceptre, Soins : 8 points ")
        print()
        print("4. Nain, HP : 20, Arme : Hache, Dégats : 30 points ")
        
        let userChoice = keyInput()
        return userChoice
    }
    
    //func to create the team of 3 char (maximum)
    public func createTeamPlayer(){
        getPlayerName()
        print("\(self.name) va composer son équipe")
        print()
        while playerTeam.count<3{
            let count = playerTeam.count
            let char = createChar(count : count)
            
            //store them in a player Array
            playerTeam.append(char)
            print("Votre hero a bien été crée")
            print()
            
            //maximum team size is 3 adn when the whole team is created show the team with the caracs
            if playerTeam.count == 3{
                print("\(self.name) est pret")
                return showCaracTeam()
            }
            
        }
    }
    
    // func to create the char
    public func createChar(count: Int) -> Character {
        let index = count + 1
        var userChoice: Int
        let charName = nameChar(index: index)
        
        repeat{
            userChoice = caracteristicClass()
        }
            
            while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
        
        var character : Character!
        
        switch userChoice{
        case 1: character = Fighter(name: charName, classe: .Fighter)
        case 2: character = Colossus(name: charName, classe: .Colossus)
        case 3: character = Wizard(name: charName, classe: .Wizard)
        case 4: character = Dwarf(name: charName, classe: .Dwarf)
        default:
            break
        }
        
        return character
}
    
    // ///////////////////
    // MARK: CHOICE     //
    // //////////////////
    
    //show the team of the current player
    public func showPlayerChoice(of team: [Character]){
        for i in team {
            let index = team.index{$0 === i}!//veut dire que le premier parametre est identique à i
            print("\(index + 1 ). \(self.showCaracTeamDetail(id: index))")
        }
        
    }
    
    //show the ennemy team
    func showEnnemyChoice(team: [Character], ennemy: Player){
        for i in team{
            let index = team.index{$0 === i}!
            print("\(index + 1 ). \(ennemy.showCaracTeamDetail(id: index))")
        }
    }
    
    
    //function to choose a fighter
    func chooseChar(charac: inout[Character]){
        
        var attacker: Character
        var inputRole: Bool = false
        
        repeat{
            let choice = readLine()
            switch choice {
            case "1":
                attacker = self.playerTeam[0]
                
                if attacker.isDead(){
                    print("Ce personnage est mort")
                    
                }else{
                    charac.append(attacker)
                    inputRole = true
                }
            case "2":
                attacker = self.playerTeam[1]
                
                if attacker.isDead(){
                    print("Ce personnage est mort")
                }else{
                    charac.append(attacker)
                    inputRole = true
                }
            case "3":
                attacker = self.playerTeam[2]
                
                if attacker.isDead(){
                    print("Ce personnage est mort")
                }else{
                    charac.append(attacker)
                    inputRole = true
                }
            default:
                print("Veuillez faire un choix entre 1, 2 et 3")
                inputRole = false
            }
        } while inputRole == false
}
   
    // ///////////////////
    // MARK: TARGET     //
    // //////////////////
    
    //function to target a ennemy player and attack
    func targetEnnemy(ennemyPlayer: Player, characters: [Character], id: Int){
        var characters = characters
        let target = ennemyPlayer.playerTeam[id]
        characters.append(target)
        target.attack(from: characters[0], on: characters[1], of: ennemyPlayer)
        characters[0].characterAttackReset()
    }
    
    //function to heal a target of your team
    func targetTeammate(characters: [Character], id: Int){
        var characters = characters
        let target = self.playerTeam[id]
        characters.append(target)
        target.heal(from: characters[0], on: characters[1])
        characters[0].characterAttackReset()
        
    }
    
    // ///////////////////
    // MARK: HEAL       //
    // //////////////////
    
    func healTarget(_ characters: inout[Character]){
        var inputRole: Bool = false
        
        repeat{
            
            let choice = readLine()
            switch choice{
            case "1":
                targetTeammate(characters: characters, id: 0)
                inputRole = true
            case "2":
                targetTeammate(characters: characters, id: 1)
                inputRole = true
            case "3":
                targetTeammate(characters: characters, id: 2)
                inputRole = true
            default:
                print("Veuillez choisir entre 1,2 et 3")
                inputRole = false
                
            }
            
        }while inputRole == false
    }
    
    // ///////////////////
    // MARK: FIGHT     //
    // //////////////////
    
    func fight(against ennemyPlayer: Player){
        //Array of the characters choosed by the players
        var characters = [Character]()
        
        //1st: Choose an attacker
        print("Selectionnez le personnage qui va attaquer(Tapez 1,2 ou 3)")
        print()
        showPlayerChoice(of: self.playerTeam)
        chooseChar(charac: &characters)
        
        //Random: Random spawn a vault
        randomSpawnWeapons(for: characters[0])
        
        //2a: Heal a teammate
        if characters[0].classe == .Wizard{
            print("Choisissez le coequipier a soigner (Tapez 1,2 ou 3)")
            print()
            showPlayerChoice(of: self.playerTeam)
            healTarget(&characters)
        }else{
            
            //2b: Attack an annemy
            print("Choisissez votre cible (Tapez 1,2 ou 3)")
            print()
            showEnnemyChoice(team: ennemyPlayer.playerTeam, ennemy: ennemyPlayer)
            
            var inputRole: Bool = false
            
            repeat{
                let choice = readLine()
                switch choice {
                case "1" :
                    targetEnnemy(ennemyPlayer: ennemyPlayer, characters: characters, id: 0)
                    inputRole = true
                case "2" :
                    targetEnnemy(ennemyPlayer: ennemyPlayer, characters: characters, id: 1)
                    inputRole = true
                case "3" :
                    targetEnnemy(ennemyPlayer: ennemyPlayer, characters: characters, id: 2)
                    inputRole = true
                default:
                    print("Veuillez faire un choix entre 1,2 et 3")
                    inputRole = false
                }
            }while inputRole == false
        }
        
    }
    
    //function to make the attack turn, i made a loop to force the player to choose between choice 1 or 2
    func turn(against ennemyPlayer: Player){
        
        print("Au tour de \(self.name) de jouer")
        print()
        print("Que souhaitez vous faire ?")
        print()
        print("1. Voir les stats de votre équipe ? - Tapez 1")
        print("2. Combattre (attaquer ou soigner) - Tapez 2")
        
        var inputRole: Bool = false
        repeat{
            let playerChoice = readLine()
            switch playerChoice{
            case "1":
                showCaracTeam()
                turn(against: ennemyPlayer)
                inputRole = true
            case "2":
                fight(against: ennemyPlayer)
                inputRole = true
            default:
                print("Veuillez choisir entre le choix 1 ou 2.")
                inputRole = false
            }
        }while inputRole == false
        
        
    }
    
    // ///////////////////
    // MARK: STATS     //
    // //////////////////
    
    //function to show the team (Wizard is by one side because of the heal skill)
    func showCaracTeamDetail(id: Int) -> String{
        let detail : String
        
        if playerTeam[id].classe == .Wizard{
            detail = " Nom : \(playerTeam[id].name) Classe : \(playerTeam[id].classe) HP : \(playerTeam[id].healthpoint) Arme : \(playerTeam[id].weapon.name) Soins : \(playerTeam[id].weapon.damages)"
        } else{
            detail = " Nom : \(playerTeam[id].name) Classe : \(playerTeam[id].classe) HP : \(playerTeam[id].healthpoint) Arme : \(playerTeam[id].weapon.name) Dommages : \(playerTeam[id].weapon.damages)"
        }
        return detail
    }
    
    //func to show the team carac updated
    func showCaracTeam(){
        for i in 0..<playerTeam.count{
            print("Heros n°\(i+1)" + "\(showCaracTeamDetail(id: i))")
        }
    }
}

