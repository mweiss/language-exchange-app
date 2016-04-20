//
//  EssayPartCell.swift
//  BluePencil
//
//  Created by Moritz Scholz on 27.03.16.
//  Copyright © 2016 mm. All rights reserved.
//

/*
 Custom UITableViewCell in the EssayCorrectView.
 Includes the `partLabel` and, if a correction has been made, the `correctionLabel`
 */

import UIKit

struct EssayPartAttributes {
  var Standard = [NSForegroundColorAttributeName:UIColor.grayColor()]
  var Corrected = [NSForegroundColorAttributeName:UIColor.grayColor(),
                   NSStrikethroughStyleAttributeName:9]
}

class EssayPartCell:UITableViewCell  {
  
  // The original text of the part.
  @IBOutlet weak var partLabel: UILabel!
  // The corrected text of the part (or empty if no correction has been made)
  @IBOutlet weak var correctionTextField: UITextField!
  
  // The part displayed in the cell.
  var part:EssayPart? {
    didSet {
      // Set labels
      if let part = part {
        if (part.isCorrected) {
          // Corrections have been made.
          partLabel.attributedText = NSAttributedString(string:part.text, attributes: EssayPartAttributes().Corrected)
          correctionTextField.text = part.correctedText
        }
        else {
          // No corrections have been made.
          partLabel.attributedText = NSAttributedString(string:part.text, attributes: EssayPartAttributes().Standard)
          correctionTextField.text = ""
        }
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Init code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state.
  }
}

extension EssayPartCell:UITextFieldDelegate {
  func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    // Check if part info has been set. If not, something's wrong and editing should not be possible to prevent problems later on.
    guard let part = part else {
      return false
    }
    
    // Mark original text as corrected (strikethrough)
    partLabel.attributedText = NSAttributedString(string:part.text, attributes: EssayPartAttributes().Corrected)

    // If no corrections have been made yet, prefill correctionTextField with current text.
    if !part.isCorrected {
      correctionTextField.text = part.text
    }
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if let part = part {
      if part.text == correctionTextField.text {
        // No corrections have been made - delete text in correctionTextField and remove strikethrough.
        partLabel.attributedText = NSAttributedString(string:part.text, attributes: EssayPartAttributes().Standard)
        correctionTextField.text = ""
      }
      
    }
  }
}