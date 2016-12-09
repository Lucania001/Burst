//
//  ViewController.swift
//  BurstChat
//
//  Created by Luke Langfield on 08/12/2016.
//  Copyright © 2016 ltlcreation. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    let firebaseAuth = FIRAuth.auth()
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    
    @IBOutlet weak var signOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signIn()
        
        
    }
    
    @IBAction func signMeOut(_ sender: Any) {
        //print ("CLICKED")
        do {
            try FIRAuth.auth()?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            // ... 
            print (error)
            return
        }
        print(GIDGoogleUser())
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                          accessToken: (authentication?.accessToken)!)
        // ...
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            if let error = error {
                // ...
                print (error)
                return
            }
            print ("SIGNED IN")
    }
    }
    

}

