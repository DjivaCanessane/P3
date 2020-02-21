//
//  SettingsViewController.swift
//  Jeu
//
//  Created by Djiva Canessane on 24/01/2020.
//  Copyright © 2020 Djiva Canessane. All rights reserved.
//

import UIKit

class PlayersNameVC: UIViewController {
    
    var playerOne: Player = Player(name: nil)
    var playerTwo: Player = Player(name: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!
    
    @IBAction func doneButton(_ sender: Any) {
        if playerOneTextField.text == "" && playerTwoTextField.text == "" {
            let alertController = UIAlertController(title: "Empty names", message:
                "Please enter name for both players.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            //demander renseignement
            self.present(alertController, animated: true, completion: nil)
        } else {
            print(playerOneTextField.text!)
            playerOne.name = playerOneTextField.text
            playerTwo.name = playerTwoTextField.text
            //page suivante
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let firstPlayerWarriors  = storyboard.instantiateViewController(identifier: "WarriorsNameVC") as WarriorsNameVC
            firstPlayerWarriors.players = [
                playerOne,
                playerTwo
            ]
            self.navigationController?.pushViewController(firstPlayerWarriors, animated: true)
        }
    }
}
