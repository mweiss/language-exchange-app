//
//  RegisterNativeLanguageConfirmationController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 06.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

/*
 Onboarding: native language gets selected by the user.
 */
// TODO: First view: Sort user's system language to the top. Second View: Sort English to the top.

class RegisterNativeLanguageConfirmationController: UIViewController, RegisterController {
  // IBOutlets
  @IBOutlet weak var nativeLanguageLabel: UILabel!
  
  // RegisterController
  var userRegistrationData = UserRegistrationData()
  
  // ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("Controller did load and received userdata:")
    print(userRegistrationData)
    print("####")
    
    // Update native label.
    // TODO: Show language label, not code.
    if (userRegistrationData.nativeLanguages.count==1) {
      // User selected one native language.
      nativeLanguageLabel.text = userRegistrationData.nativeLanguages[0]
    }
    else if (userRegistrationData.nativeLanguages.count>1)  {
      nativeLanguageLabel.text = userRegistrationData.nativeLanguages.joinWithSeparator(", ")
    }
    else  {
      // No native languages selected.
      print("キャーーーーー")  // TODO: Handle this error.
    }
    
  }
  
  // MARK: Flow
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if ( (segue.identifier == LanguageSelectorData().nativeLanguageConfirmationAddSegueIdentifier) ||
          (segue.identifier == LanguageSelectorData().nativeLanguageConfirmationProceedSegueIdentifier))  {
      // User wants to add another language or proceeds to the next view.
      var destinationController = segue.destinationViewController as! RegisterController
      destinationController.userRegistrationData = self.userRegistrationData
    }
  }
  
}