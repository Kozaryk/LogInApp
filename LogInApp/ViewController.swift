//
//  ViewController.swift
//  LogInApp
//
//  Created by Козар Ігор on 25.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var ForgotName: UIButton!
    @IBOutlet weak var ForgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: WelcomeViewController = segue.destination as! WelcomeViewController
        print(Username.text!)
        destinationVC.name = Username.text!
    }

    @IBAction func LogIn(_ sender: Any) {
       
        if Username.text == "User" {
            if Password.text == "Password"{
            }else{
                let alert = UIAlertController(title: "Error!", message: "Enter your Password.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }else{
            let alert = UIAlertController(title: "Error!", message: "Enter your Username.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        }
    
    @IBAction func remindUsername(_ sender: Any) {
        alert(name: "Username", value: "User")
    }
    @IBAction func remindPassword(_ sender: Any) {
        alert(name: "Password", value: "Password")
    }
    

    func alert(name: String, value: String){
        let alert = UIAlertController(title: "\(name) remider", message: "It's '\(value)'.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
 
    
    @IBAction func Clear(_ unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? WelcomeViewController else { return }
        Username.text = source.text
        Password.text = source.text
    }
    
    
}


