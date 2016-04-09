//
//  RegisterLearnLanguageConfirmationController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 09.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

/*
 Onboarding: Are you learning any other languages?
 */
class RegisterLearnLanguageConfirmationController: UIViewController, RegisterController {
  // IBOutlets
  @IBOutlet weak var learnLanguagesLabel: UILabel!
  @IBOutlet weak var learnLevelsLabel: UILabel!
  
  // RegisterController
  var userRegistrationData = UserRegistrationData()
  
  // ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(userRegistrationData)
    
    // Update language and level in interface.
    // TODO: Show language name, not code
    // TODO: Display in a more pretty way.
    learnLanguagesLabel.text = userRegistrationData.learnLanguages.joinWithSeparator(", ")
    var levelsString = ""
    for lvl in userRegistrationData.learnLanguagesLevels {
      levelsString.appendContentsOf(", \(LanguageSelectorData().languageLevels[lvl])")
    }
    learnLevelsLabel.text = levelsString
  }
  
  // MARK: Flow
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if ( (segue.identifier == LanguageSelectorData().learnLanguageConfirmationAddSegueIdentifier) ||
      (segue.identifier == LanguageSelectorData().learnLanguageLevelConfirmationSegueIdentifier))  {
      // User wants to add another language or proceeds to the next view.
      var destinationController = segue.destinationViewController as! RegisterController
      destinationController.userRegistrationData = self.userRegistrationData
    }
  }
  
}