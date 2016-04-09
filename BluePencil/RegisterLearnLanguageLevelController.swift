//
//  RegisterLearnLanguageLevelController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 09.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

/*
 Onboarding: Studylanguage level gets selected by the user.
 */
// TODO: Sort English to the top.

class RegisterLearnLanguageLevelController: UIViewController, RegisterController {
  // InterfaceBuilder
  @IBOutlet weak var tableViewHeadlineLabel: UILabel!
  
  // RegisterController
  var userRegistrationData = UserRegistrationData()
  
  // MARK: Flow
  override func viewDidLoad() {
    print("Controller did load and received userdata:")
    print(userRegistrationData)
    print("####")
    
    // TODO: Language name (instead of code)
    tableViewHeadlineLabel.text = "What's your level in \(userRegistrationData.learnLanguages[userRegistrationData.learnLanguages.count-1])"
    title = "\(userRegistrationData.learnLanguages[userRegistrationData.learnLanguages.count-1]): Level"
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier==LanguageSelectorData().learnLanguageSelectedSegueIdentifier)  {
      // User wants to add another language or continues.
      var destinationController = segue.destinationViewController as! RegisterController
      destinationController.userRegistrationData = self.userRegistrationData
    }
  
  }
}

// MARK: UITableViewDataSource-methods
extension RegisterLearnLanguageLevelController:UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return LanguageSelectorData().languageLevels.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(LanguageSelectorData().learnLevelCellIdentifier, forIndexPath: indexPath)
    cell.textLabel?.text = LanguageSelectorData().languageLevels[indexPath.row]
    return cell
  }
}

// MARK: UITableViewDelegate-methods
extension RegisterLearnLanguageLevelController:UITableViewDelegate {
  func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    print("Will select \(LanguageSelectorData().languageLevels[indexPath.row])")
    userRegistrationData.learnLanguagesLevels[userRegistrationData.learnLanguagesLevels.count-1] = indexPath.row
    
    return indexPath
  }
}