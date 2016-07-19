//
//  ThirdViewController.swift
//  ironchat
//
//  Created by Taylor Frost on 7/19/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func createUser(email: String, password: String) {
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil{
                print(error?.localizedDescription)
            }
            
            if let user = user{
                
                print(user.uid)
                print("Success! Create user \(email)")
                
            }
            
        }
    }
    
    @IBAction func firstButton(sender: UIButton) {
        
        let emailSignUp = firstTextField.text
        let passwordSignUp = secondTextField.text
        
        if let emailSignUp = emailSignUp {
            if let passwordSignUp = passwordSignUp {
        createUser(emailSignUp, password: passwordSignUp)
                
        
                
            }
        }
    }
    
    
    

}
