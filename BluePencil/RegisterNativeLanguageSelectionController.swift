//
//  RegisterNativeLanguageSelectionController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 05.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

/*
 Onboarding: native language gets selected by the user.
 */
// TODO: First view: Sort user's system language to the top. Second View: Sort English to the top.
// TODO: prepareForSegue is triggered before didSelectRowAtIndexPath => therefore empty registration data is handed over.
  // Solution: Add a segue from V1 to V2 and trigger in didSelectRow

class RegisterNativeLanguageSelectionController: UIViewController, LanguageSelector, RegisterController {
  var userRegistrationData = UserRegistrationData()
  
  // MARK: Flow
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    print("Will perform segue")
    if (segue.identifier == LanguageSelectorData().nativeLanguageSelectedSegueIdentifier) {
      // User selected a native language. Handover registration data to next view controller.
      var destinationViewController:RegisterController = segue.destinationViewController as! RegisterController // TODO: Can't use let when force-downcasting to RegisterController-protocol. When I used RegisterNative...Controller it worked. Strange.
      destinationViewController.userRegistrationData = self.userRegistrationData
    }
  }
}

// MARK: UITableViewDataSource-methods
extension RegisterNativeLanguageSelectionController:UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return LanguageSelectorData().languageLabels.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(LanguageSelectorData().nativeCellIdentifier, forIndexPath: indexPath)
    cell.textLabel?.text = LanguageSelectorData().languageLabels[indexPath.row]
    return cell
  }
}

// MARK: UITableViewDelegate-methods
extension RegisterNativeLanguageSelectionController:UITableViewDelegate {
  func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    print("Will select \(LanguageSelectorData().languageCodes[indexPath.row])")
    // Add language to registration data.
    userRegistrationData.nativeLanguages.append(LanguageSelectorData().languageCodes[indexPath.row])
    
    return indexPath
  }
  
}