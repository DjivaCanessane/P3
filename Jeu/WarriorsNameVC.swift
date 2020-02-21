//
//  WarriorsNameViewController.swift
//  Jeu
//
//  Created by Djiva Canessane on 31/01/2020.
//  Copyright © 2020 Djiva Canessane. All rights reserved.
//

import UIKit

class WarriorsNameVC: UIViewController {
    
    var players: [Player] = []
    var playerIndex: Int = 0
    var p1Warriors: [Warrior] = []
    var p2Warriors: [Warrior] = []
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var w1Name: UITextField!
    @IBOutlet weak var w1Weapon: UISegmentedControl!
    @IBOutlet weak var w2Name: UITextField!
    @IBOutlet weak var w2Weapon: UISegmentedControl!
    @IBOutlet weak var w3Name: UITextField!
    @IBOutlet weak var w3Weapon: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initScreen()
        
    }
    
    func initScreen() {
        guard players.indices.contains(playerIndex) else { return }
        let player = players[playerIndex]
        self.titleLabel.text = "Please enter warriors' name and type of weapon for \(player.name!)"
    }
    
    func selectedWeapon(_ selected: Int) -> WeaponType {
        return WeaponType(rawValue: selected) ?? .heavySword
    }
    
    @IBAction func onDone(_ sender: Any) {
        guard w1Name.text != "" && w2Name.text != "" && w3Name.text != "" else {
            let alertController = UIAlertController(title: "Empty names", message:
                "Please enter name for all players.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            //demander renseignement
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let warriors: [Warrior] = [
            Warrior(name: w1Name.text!,
                    weapon: Weapon(type: selectedWeapon(w1Weapon.selectedSegmentIndex))),
            Warrior(name: w2Name.text!,
                    weapon: Weapon(type: selectedWeapon(w2Weapon.selectedSegmentIndex))),
            Warrior(name: w3Name.text!,
                    weapon: Weapon(type: selectedWeapon(w3Weapon.selectedSegmentIndex)))
        ]
        players[playerIndex].warriors = warriors
        if players.indices.contains(playerIndex + 1) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondPlayerWarriors  = storyboard.instantiateViewController(identifier: "WarriorsNameVC") as WarriorsNameVC
            secondPlayerWarriors.players = self.players
            secondPlayerWarriors.playerIndex = playerIndex + 1
            self.navigationController?.pushViewController(secondPlayerWarriors, animated: true)
        } else {
            //lance le jeu
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let groundVC  = storyboard.instantiateViewController(identifier: "GroundViewController") as GroundViewController
            
            groundVC.playerOne = players[0]
            groundVC.playerTwo = players[1]
            
            self.navigationController?.pushViewController(groundVC, animated: true)
        }
    }
    
}
