//
//  RegisterLearnLanguageSelectionController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 05.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

/*
 Onboarding: Lean language gets selected by the user.
 */
// TODO: Sort English to the top.

class RegisterLearnLanguageSelectionController: UIViewController, LanguageSelector {
  
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
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("Selected \(LanguageSelectorData().languageLabels[indexPath.row])")
  }
}