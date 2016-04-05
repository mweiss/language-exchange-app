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
  let languageCodes = ["English", "German", "Japanese", "Klingonian"]
  let nativeCellIdentifier = "CellNativeLanguage"
  let learnCellIdentifier = "CellLearnLanguage"
}

protocol LanguageSelector {
  //
}

extension LanguageSelector where Self: UIViewController {
  
}