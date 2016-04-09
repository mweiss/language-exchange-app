//
//  LanguageSelector.swift
//  BluePencil
//
//  Created by Moritz Scholz on 05.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

/*
 Protocol for language selection ViewControllers which consist of a TableView with a list of languages.
 */

import UIKit

struct LanguageSelectorData {
  let languageLabels = ["English", "German", "Japanese", "Klingonian"]
  let languageCodes = ["ENG", "GER", "JPN", "KLI"]
  let languageLevels = ["Beginner", "Conversational", "Intermediate", "Fluent"]
  let nativeCellIdentifier = "CellNativeLanguage"
  let learnCellIdentifier = "CellLearnLanguage"
  let learnLevelCellIdentifier = "CellLearnLevel"
  
  
  let nativeLanguageSelectedSegueIdentifier = "NativeLanguageSelectedSegue"
  let nativeLanguageConfirmationAddSegueIdentifier = "AddNativeLanguageSegue"
  let nativeLanguageConfirmationProceedSegueIdentifier = "ConfirmNativeLanguageSegue"
  
  let selectLearnLanguageLevelSegueIdentifier = "SelectLearnLanguageLevelSegue"
  let learnLanguageSelectedSegueIdentifier = "LearnLanguageLevelSelectedSegue"
  
  let learnLanguageConfirmationAddSegueIdentifier = "AddLearnLanguageSegue"
  let learnLanguageLevelConfirmationSegueIdentifier = "LearnLanguageLevelContinueSegue"
  
  let finishRegistrationSegueIdentifier = "FinishRegistrationSegue"
  
}

protocol LanguageSelector {
  //
}

extension LanguageSelector where Self: UIViewController {
  
}