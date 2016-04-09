//
//  RegisterLearnLanguageSelectionController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 05.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

/*
 Onboarding: Studylanguage gets selected by the user.
 */
// TODO: Sort English to the top.

class RegisterLearnLanguageSelectionController: UIViewController, LanguageSelector, RegisterController {
  // RegisterController
  var userRegistrationData = UserRegistrationData()
  
  // MARK: Flow
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier==LanguageSelectorData().selectLearnLanguageLevelSegueIdentifier) {
      // Learn language selected, proceed to level selection view.
      var destinationController = segue.destinationViewController as! RegisterController
      destinationController.userRegistrationData = self.userRegistrationData
    }
  }
  
}

// MARK: UITableViewDataSource-methods
extension RegisterLearnLanguageSelectionController:UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return LanguageSelectorData().languageLabels.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(LanguageSelectorData().learnCellIdentifier, forIndexPath: indexPath)
    cell.textLabel?.text = LanguageSelectorData().languageLabels[indexPath.row]
    return cell
  }
}

// MARK: UITableViewDelegate-methods
extension RegisterLearnLanguageSelectionController:UITableViewDelegate {
  func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    print("Will select \(LanguageSelectorData().languageCodes[indexPath.row])")
    userRegistrationData.learnLanguages.append(LanguageSelectorData().languageCodes[indexPath.row])
    userRegistrationData.learnLanguagesLevels.append(-1)
    
    return indexPath
  }
}