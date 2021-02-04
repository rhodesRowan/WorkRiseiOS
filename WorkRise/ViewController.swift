//
//  ViewController.swift
//  WorkRise
//
//  Created by Rowan Rhodes on 25/01/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func signInPressed(_ sender: Any) {
        guard let email = emailTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              let password = passwordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                let alert = UIAlertController(title: "Oops..", message: error.localizedDescription, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
            
            if let user = result?.user {
                let alert = UIAlertController(title: "YAY!", message: "\(user.email) is now registered", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

