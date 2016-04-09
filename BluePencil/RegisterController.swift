//
//  RegisterController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 06.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

/*
 Protocol for ViewControllers which are part of the registration process and have to handle entered onboarding data.
 */


import Foundation

struct UserRegistrationData {
  /// Array of codes for selected native languages.
  var nativeLanguages:[String]
  /// Array for studied language codes
  var learnLanguages:[String]
  /// Array for studied language's levels
  var learnLanguagesLevels:[Int]
  /// Accept corrections from which language level. 
  /// -1 = only from natives; 0..learnLanguagesLevels.count-1: From this level and above.
  var acceptCorrectionsAboveLevel:Int
  
  init()  {
    self.nativeLanguages = [String]()
    self.learnLanguages = [String]()
    self.learnLanguagesLevels = [Int]()
    self.acceptCorrectionsAboveLevel = -1
  }
}

protocol RegisterController {
  /// Registration data during onboarding process.
  var userRegistrationData:UserRegistrationData { get set }
}