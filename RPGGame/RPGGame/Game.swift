//
//  Game.swift
//  RPGGame
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
struct Game{
    var player1:Player
    var player2:Player
    
    init(player1:Player, player2:Player){
        self.player1 = player1
        self.player2 = player2
    }
    
    func newGame(){
        rules()
        player1.createTeamPlayer()
        player2.createTeamPlayer()
        
        while player1.playerTeam.count>0 && player2.playerTeam.count>0{
            //player 1 play
            player1.turn(against: player2)
            victory()
            //player 2 play
            if player2.playerTeam.count>0{
                player2.turn(against: player1)
                victory()
            }
        }
        
        
    }
    
    func victory(){
        if player1.playerTeam.count <= 0 {print("\(player2.name) est victorieux !")}
        else if player2.playerTeam.count <= 0 {print("\(player1.name) est victorieux !")}
    }
    
    func rules(){
        print("""
=========================================================================================
|                                Bienvenue dans l'arène                                 |
|                                                                                       |
| Dans ce jeu de combat en TOUR PAR TOUR, 2 Joueurs s'affrontent dans un combat à mort. |
| - Chaque joueur va composer une équipe de 3 combattants.                              |
| - L'un après l'autre, ils attaqueront leur adversaire et lui infligeront des dégats.  |
| - Le vainqueur est le premier qui tue les combattants de son adversaire.              |
|                                                                                       |
=========================================================================================

""")
    }
}
