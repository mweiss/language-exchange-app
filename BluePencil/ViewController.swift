//
//  ViewController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 27.03.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // TODO: Implement facebook login. For now: Proceed to post feed
    print("Skipping login, proceeding to register")
    dispatch_async(dispatch_get_main_queue()) {
      //self.performSegueWithIdentifier("FirstTimeUserRegister", sender:self)
      self.performSegueWithIdentifier("LoginSuccessfulProceedToFeed", sender: self)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

