//
//  GroundVC.swift
//  Jeu
//
//  Created by Djiva Canessane on 14/02/2020.
//  Copyright © 2020 Djiva Canessane. All rights reserved.
//

import UIKit

class GroundViewController: UIViewController {
    
    var round: Int = 0;
    
    var playerOne: Player = Player(name: nil)
    var playerTwo: Player = Player(name: nil)
    
    @IBOutlet weak var playerOneNameLabel: UILabel!
    @IBOutlet weak var wvOnePlayerOne: WarriorView!
    @IBOutlet weak var wvTwoPlayerOne: WarriorView!
    @IBOutlet weak var wvThreePlayerOne: WarriorView!
    
    @IBOutlet weak var playerTwoNameLabel: UILabel!
    @IBOutlet weak var wvOnePlayerTwo: WarriorView!
    @IBOutlet weak var wvTwoPlayerTwo: WarriorView!
    @IBOutlet weak var wvThreePlayerTwo: WarriorView!
    
    @IBOutlet weak var coffreLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var warriorWithWv: [Warrior: WarriorView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        playerOneNameLabel.text = playerOne.name
        wvOnePlayerOne.nameLabel.text = playerOne.warriors[0].name
        wvTwoPlayerOne.nameLabel.text = playerOne.warriors[1].name
        wvThreePlayerOne.nameLabel.text = playerOne.warriors[2].name

        playerTwoNameLabel.text = playerTwo.name
        wvOnePlayerTwo.nameLabel.text = playerTwo.warriors[0].name
        wvTwoPlayerTwo.nameLabel.text = playerTwo.warriors[1].name
        wvThreePlayerTwo.nameLabel.text = playerTwo.warriors[2].name
        
        warriorWithWv = [
            playerOne.warriors[0]: wvOnePlayerOne,
            playerOne.warriors[1]: wvTwoPlayerOne,
            playerOne.warriors[2]: wvThreePlayerOne,
            playerTwo.warriors[0]: wvOnePlayerTwo,
            playerTwo.warriors[1]: wvTwoPlayerTwo,
            playerTwo.warriors[2]: wvThreePlayerTwo
        ]
    }

    func attack(atkWarrior: Warrior, rcvWarrior: Warrior, weapon: Weapon) {
        
        atkWarrior.stamina = atkWarrior.stamina - weapon.consumedEnergy
        rcvWarrior.life = rcvWarrior.life - weapon.damage
        
    }
    
    func chooseWarriorDialog(player: Player) {
        let alertController = UIAlertController(title: "Choose warrior", message:
            "\(player.name ?? "nil"), select your warrior", preferredStyle: .alert)
        
        for warrior in player.warriors {
            if (warrior.life > 0) {
                alertController.addAction(UIAlertAction(title: warrior.name, style: .default, handler:{ _ in
                    //Pourquoi self ? et _ in
                    self.chooseWarriorActionDialog(player: player, warrior: warrior)
                } ))
            }
        }
        
        self.present(alertController, animated: true, completion: nil)

    }
    
    func chooseWarriorActionDialog(player: Player, warrior: Warrior) {
        let alertController = UIAlertController(title: "Action", message:
            "\(player.name ?? "nil"), \(warrior.name) should attack, heal, or take a rest to regenerate stamina ?", preferredStyle: .alert)
        //Attack
        alertController.addAction(UIAlertAction(title: "Attack", style: .default, handler: { _ in
            var opponent = self.round % 2 == 0 ? self.playerTwo : self.playerOne
            self.chooseOpponentWarriorDialog(player: player, warrior: warrior, opponentPlayer: opponent)
        } ))
        //Heal
        alertController.addAction(UIAlertAction(title: "Heal", style: .default, handler: { _ in
            var healPoints: Int = warrior.life > 70 ? 100 - warrior.life : 30
            warrior.life += healPoints
            self.warriorWithWv[warrior]?.healthLabel.text = "\(warrior.life)"
        } ))
        //Rest
        alertController.addAction(UIAlertAction(title: "Rest", style: .default, handler: { _ in
            var staminaPoints: Int = warrior.stamina > 80 ? 100 - warrior.life : 20
            warrior.stamina += staminaPoints
            self.warriorWithWv[warrior]?.staminaLabel.text = "\(warrior.stamina)"
        } ))
    }
    
    func chooseOpponentWarriorDialog(player: Player, warrior: Warrior, opponentPlayer: Player) {
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        round += 1
        if (round % 2 != 0 ) {
            chooseWarriorDialog(player: playerOne)
        } else {
            chooseWarriorDialog(player: playerTwo)
        }
    }
    
}
