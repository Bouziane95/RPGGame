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
   
