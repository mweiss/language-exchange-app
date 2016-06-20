//
//  ViewController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 27.03.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
  // FB Login Button
  var fbLoginButton:FBSDKLoginButton = FBSDKLoginButton()
  let fbReadPermissionsNecessary:Set = ["public_profile", "email"]
  let fbReadPermissionsOptional:Set = ["user_friends"]

  override func viewDidLoad() {
    super.viewDidLoad()

    // Facebook Login
    // Set delegate
    fbLoginButton.delegate = self
    
    // Read permissions
    fbLoginButton.readPermissions = Array(fbReadPermissionsNecessary.union(fbReadPermissionsOptional))
    
    // Set position & add to view
    fbLoginButton.center = self.view.center
    view.addSubview(fbLoginButton)
    
    // TODO: Implement facebook login. For now: Proceed to post feed
    /*
     // Code for skipping to register flow or feed.
    print("Skipping login, proceeding to register")
    dispatch_async(dispatch_get_main_queue()) {
      self.performSegueWithIdentifier("FirstTimeUserRegister", sender:self)
      //self.performSegueWithIdentifier("LoginSuccessfulProceedToFeed", sender: self)
    }
    */
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

// MARK: FBLoginButtonDelegate-methods
extension ViewController:FBSDKLoginButtonDelegate {
  func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
    return true
  }
  
  func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
    print("Returned from Facebook-login")
    print(error)
    print(result)

    // Check if no error occured and user granted all necessary permissions.
    if ((error) != nil) {
      // Handle error
      // TODO
      print(error)
    }
    else if (result.isCancelled)  {
      // User cancelled the login.
      // TODO
      print("Login cancelled")
    }
    else {
      // Login succesful
      // Check permissions
      if !((result.declinedPermissions as! Set<String>).isDisjointWith(fbReadPermissionsNecessary)) {
        // Not all necessary permissions were given
        // TODO
        print("Not all necessary permissions granted")
      }
      else {
        // All necessary permissions granted!
        // TODO: Register user through APIManager
      }
    }
    
    
  }
  
  func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
    
  }
}

