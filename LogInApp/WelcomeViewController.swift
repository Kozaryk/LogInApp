//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Козар Ігор on 25.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var usernameTextMessage: UILabel!
    var text = ""
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextMessage.text = "Nice to see you, " + name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            text = ""
    }
    

    
    @IBAction func logOutPressed(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
}
