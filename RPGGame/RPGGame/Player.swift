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
