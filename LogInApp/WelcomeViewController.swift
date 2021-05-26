//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Козар Ігор on 25.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var usernameTextMessage: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var text = ""
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadows()
        
        usernameTextMessage.text = "Nice to see you, " + name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            text = ""
    }

    @IBAction func logOutPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func shadows() {
        let array = [usernameTextMessage, logOutButton]
        for index in array{
            index?.layer.shadowOffset = CGSize(width: 2, height: 2)
            index?.layer.shadowOpacity = 0.4
            index?.layer.shadowRadius = 5
        }
    }
}
