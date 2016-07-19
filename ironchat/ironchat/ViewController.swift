//
//  ViewController.swift
//  ironchat
//
//  Created by Taylor Frost on 7/19/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Check if I am logged in or not
        
        if let user = FIRAuth.auth()?.currentUser {
            
            print("I am signed in as user \(user.email)")
            
//            self.signOutUser()
            
        } else {
            
            print("I am not signed in")
            
            self.signInUser("taylorhamblinfrost@gmail.com", password: "123456")
        }
        
//        self.createUser("taylorhamblinfrost@gmail.com", password: "123456")
    }

    
//    func createUser(email: String, password: String) {
//        
//        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
//            
//            (user, error) in
//            
//            if error != nil{
//                print(error?.localizedDescription)
//            }
//            
//            if let user = user{
//                
//                print(user.uid)
//                print("Success! Create user \(email)")
//                
//            }
//
//        }
//    }

    
    func signOutUser() {
        
        try! FIRAuth.auth()!.signOut()
        
    }
    
    func signInUser(email: String, password: String) {
        
        FIRAuth.auth()?.signInWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil {
                
                print(error?.localizedDescription)
                print("Sorry, this user hasn't been registered!")
            }
            
            if let user = user {
                
                print("\(user.email) signed in!")
            }
            
        }
   
    }
    
    @IBAction func firstButton(sender: UIButton) {
        
        let emailSignIn = firstTextField.text
        let passwordSignIn = secondTextField.text
        
        if let passwordSignIn = passwordSignIn {
            if let emailSignIn = emailSignIn {
        signInUser(emailSignIn, password: passwordSignIn)
        
            } else {
                print("Invalid email")
                
            }
        
        } else {
            
            print("Invalid password")
        }

    }
    
    @IBAction func secondButton(sender: UIButton) {
        
        
        performSegueWithIdentifier("secondSegue", sender: self)
        
    }
    
}

