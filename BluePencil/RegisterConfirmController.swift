//
//  RegisterConfirmController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 09.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

/*
 Onboarding: Are you learning any other languages?
 */
class RegisterConfirmController: UIViewController, RegisterController {
  @IBOutlet weak var TMPUserRegistrationDataText: UITextView!
  @IBOutlet weak var acceptAllCorrectionsSwitch: UISwitch!
  
  // RegisterController
  var userRegistrationData = UserRegistrationData()
  
  // ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()

    // TODO: temp
    TMPUserRegistrationDataText.text = "\(userRegistrationData)"
    }
  
  // MARK: Flow
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier==LanguageSelectorData().finishRegistrationSegueIdentifier) {
      var destinationController = segue.destinationViewController as! RegisterController
      destinationController.userRegistrationData = self.userRegistrationData
    }
   }
  
  // MARK: Interface Builder
  /// User toggled the Switch-Button for accepting corrections also from non-natives.
  @IBAction func acceptAllCorrectionsValueChanged(sender: AnyObject) {
    if (acceptAllCorrectionsSwitch.on)  {
      // Accept also from the highest level of language-learners.
      userRegistrationData.acceptCorrectionsAboveLevel = LanguageSelectorData().languageLevels.count-1
    }
    else{
      // Accept only from the highest level (i.e. native)
      userRegistrationData.acceptCorrectionsAboveLevel = -1
    }
    
    // TODO: tmp
    TMPUserRegistrationDataText.text = "\(userRegistrationData)"
  }
  
}