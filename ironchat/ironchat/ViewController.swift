//
//  ViewController.swift
//  ironchat
//
//  Created by Taylor Frost on 7/19/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        self.firstTextField.delegate = self
        
        //Check if I am logged in or not
        
        if let user = FIRAuth.auth()?.currentUser {
            
            print("I am signed in as user \(user.email)")
            
//            self.signOutUser()
            
        } else {
            
            print("I am not signed in")
            
            self.signInUser("taylorhamblinfrost@gmail.com", password: "123456")
        }
        
    }

  
    func signOutUser() {
        
        try! FIRAuth.auth()!.signOut()
        
    }
    
    func signInUser(email: String, password: String) {
        
        FIRAuth.auth()?.signInWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil {
                
                print(error?.localizedDescription)
                print("Sorry, this user hasn't been registered!")
                self.alertController()
            }
            
            if let user = user {
                
                print("\(user.email) signed in!")
                
                self.performSegueWithIdentifier("firstSegue", sender: self)
  
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
    
    func alertController() {
        
        let alertController = UIAlertController(title: "Sorry!", message: "We don't recognize this login.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
        })
        
        alertController.addAction(saveAction)
       
        self.presentViewController(alertController, animated: true, completion: nil)
        }
    
    func dismissKeyboard() {

        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.firstTextField {
            self.secondTextField.becomeFirstResponder()
        }
        
        return true
    }
    

    
}
    


