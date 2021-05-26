//
//  ViewController.swift
//  LogInApp
//
//  Created by Козар Ігор on 25.05.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var ForgotName: UIButton!
    @IBOutlet weak var ForgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //lifting content from the keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
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
    @IBAction func Clear(_ unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? WelcomeViewController else { return }
        Username.text = source.text
        Password .text = source.text
    }
    
    @IBAction func displeyTapped(_ sender: Any) {
        Username.resignFirstResponder()
        Password.resignFirstResponder()
    }
    
    func alert(name: String, value: String){
        let alert = UIAlertController(title: "\(name) remider", message: "It's '\(value)'.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
 //lifting content from the keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == Username {
           textField.resignFirstResponder()
           Password.becomeFirstResponder()
        } else if textField == Password {
           textField.resignFirstResponder()
            LogInButton.sendActions(for: .touchUpInside)
            
        }
       return true
      }
    
    
}



