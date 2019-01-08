# RpgGame

How to play

This project is a part of Open Classrooms course on Ios developpment. It is a command line RPG game where 2 players create 2 team of 3 characters with different abilities and weapons. The first player who kills the other player characters wins !

Each player can pick a character between 4 jobs :

- Fighter
- Colossus
- Dwarf
- Wizard

Each job has a specific weapon with specific damages.

When a player creates a character, he is prompted to choose a name and a class.

When the 2 teams have been created, the game is a turn by turn game. During a turn, a player have 2 options

Display his team to see all the current caracteristics ( health points/damages...)
Attack
Then he has to choose an attacker . The wizard attack does cause any damage, it heals a teammate.

When attacker attacks he has a random odd to cast an offensive class ability :

Warrior : give a critical strike (Double the atk)
Wizard : no offensive ability
Colossus : no offensive ability
Dwarf : no offensive ability

At random moments, a vault can spawn at this step and propose a new weapon that can be better than class weapon or worst. The Player can choose to equip with it or not.

Then the attacker choose the player he wishes to attack ( or heal). We call this character the target

Before target receives damages he has a random odd to cast a defensive class ability :

Warrior : no defensive ability
Wizard : reduce the atk of the opponent
Colossus: Block the atttack ( no damage)
Dwarf : Block 10 points from the opponent 


