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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)

        

    }
    
    func createUser(email: String, password: String) {
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil{
                print(error?.localizedDescription)
                self.alertController()
            }
            
            if let user = user{
                
                print(user.uid)
                print("Success! Create user \(email)")
                self.performSegueWithIdentifier("thirdSegue", sender: self)
                
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
    
    func alertController() {
        
        let alertController = UIAlertController(title: "Sorry!", message: "Your email or password isn't in a form we can use.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
        })
        
        alertController.addAction(saveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }

}
