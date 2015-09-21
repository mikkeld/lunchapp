//
//  SignInViewController.swift
//  LunchApp
//
//  Created by Mikkel Dengsøe on 9/20/15.
//  Copyright © 2015 Mikkel Dengsøe. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    @IBAction func signInButtonPressed(sender: UIButton) {
        
        if emailLogin.text == "" || passwordLogin.text == "" {
            
            displayAlert("Error", message: "Both fields must be filled out")
            
        } else {
            
            PFUser.logInWithUsernameInBackground(emailLogin.text!, password: passwordLogin.text!)
                { (user: PFUser?, error: NSError?) -> Void in
                    
                    if user != nil {
                        
                        print("User logged in")
                        
                    } else {
                        
                        var errorMessage = "Please try again later"
                        
                        if let errorString = error!.userInfo["error"] as? String {
                            
                            errorMessage = errorString
                            
                        }
                        
                        self.displayAlert("Failed SignUp", message: errorMessage)
                        
                    }
                    
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}