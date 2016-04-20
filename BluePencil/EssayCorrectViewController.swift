//
//  EssayCorrectViewController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 27.03.16.
//  Copyright © 2016 mm. All rights reserved.
//

/*
 ViewController for correcting an essay.
 */

// TODO: Add toolbar (with UITextFields inputAccessoryView-property)

import UIKit

class EssayCorrectViewController: UIViewController {
  
  @IBOutlet weak var essayTextView: UITextView!
  
  // Attributes for essayTextView
  struct EssayTextAttributes  {
    var Standard   = ["type":"part",
                      NSForegroundColorAttributeName:UIColor.blackColor()]
    var CorrectedPart = ["type":"correctedPart",
                         NSForegroundColorAttributeName:UIColor.grayColor(),
                           NSStrikethroughStyleAttributeName:9]
    var Correction      = ["type":"correction",
                           NSForegroundColorAttributeName:UIColor.redColor()]
  }
  
  
  var essayTitle:String = ""
  var essay = Essay()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Set title to title of essay.
    title = essayTitle
    
    // TEMP: Create essay to display
    let text = "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.\n\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.\n\nNam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.\n\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.\n\nAt vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore dolores duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et gubergren, kasd magna no rebum. sanctus sea sed takimata ut vero voluptua. est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.\n\nConsetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
    // Add text part by part.
    for line in text.componentsSeparatedByString(".") {
      essay.append(EssayPart(text: "\(line)."))
    }
    
    // Update text in TextView
    essayTextView.attributedText = essayAttributedText()
    
    // Add "Done" button to button bar.
    let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(EssayCorrectViewController.doneEditing))
    navigationItem.rightBarButtonItem = doneButton
  }
  
  /// User is done editing and pressed the corresponding button.
  func doneEditing() {
    // TODO implement
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

// MARK: Methods for managing editing range.
extension EssayCorrectViewController  {
  /// User did select a part in the essay.
  func didSelectPartAtIndex(index:Int)  {
    
  }
  
  /// User selected his own correction for a part.
  func didSelectCorrectionForPartAtIndex(index:Int) {
    
  }
  
  /// User started typing to edit the part in the essay.
  func didBeginEditingPartAtIndex(index:Int)  {
    
  }
  
  
}

// MARK: Methods for attributing text.
extension EssayCorrectViewController  {
  /// Sets up attributed text for the essayTextView.
  func essayAttributedText() -> NSAttributedString {
    let essayString = NSMutableAttributedString(string:"")
    
    var part:EssayPart
    var partString:NSMutableAttributedString
    var correctionString:NSMutableAttributedString
    for i in 0...essay.partsCount-1 {
      part = essay.partAtIndex(i)!

      // Check if text has been corrected.
      if (part.text == part.correctedText)  {
        // No correction made.
        partString = NSMutableAttributedString(string: part.text, attributes: EssayTextAttributes().Standard)
        correctionString = NSMutableAttributedString(string: "")
      }
      else {
        // Correction has been made.
        partString = NSMutableAttributedString(string: part.text, attributes: EssayTextAttributes().CorrectedPart)
        correctionString = NSMutableAttributedString(string: part.correctedText, attributes: EssayTextAttributes().Correction)
      }
      
      // Add part IDs to attributes.
      partString.addAttribute("partID", value: i, range: NSMakeRange(0, partString.length))
      correctionString.addAttribute("partID", value: i, range: NSMakeRange(0, correctionString.length))
      
      // Append strings to essay string.
      essayString.appendAttributedString(partString)
      essayString.appendAttributedString(correctionString)
    }
    
    return essayString
  }
  
  // TODO: Change this to addAttributeForPartAtIndex:...
  /*
  func attributedTextForHighlightAtSelection(pos:Int) -> NSAttributedString? {
    let s = NSMutableAttributedString(string: essay.text)
    
    guard let selectedPart = essay.partAtPosition(pos) else   {
      s.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSMakeRange(0, essay.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)))
      return s
    }
    
    // Selected part in range of essay text?
    if (essay.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)>=selectedPart.range.location+selectedPart.range.length) {
      // Mark selected sentence
      s.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: selectedPart.range)
      
      // Format rest in grey.
      let selectedPartEnd = selectedPart.range.location+selectedPart.range.length
      s.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSMakeRange(0, selectedPart.range.location))
      s.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSMakeRange(selectedPartEnd,essay.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)-selectedPartEnd))

      // Return attributed string.
      return s as NSAttributedString
    }
    else {
      // Return standard text without highlights.
      s.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSMakeRange(0, essay.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)))
      return s
    }    
  }
 */
}

// MARK: UITextView-delegate methods
extension EssayCorrectViewController:UITextViewDelegate {
  func textViewDidChangeSelection(textView: UITextView) {
    let pos = textView.selectedRange.location

    print("# Selected: \(pos).")
    
    if (pos < essayTextView.attributedText.length) {
      // Get attributes at position.
      let typeAtSelection = essayTextView.attributedText.attribute("type", atIndex: pos, effectiveRange: nil)
      let partIDAtSelection = essayTextView.attributedText.attribute("partID", atIndex: pos, effectiveRange: nil)
      print(typeAtSelection)
      print(partIDAtSelection)
    }

  }
  
  func textViewShouldBeginEditing(textView: UITextView) -> Bool {
    print("# Should begin editing.")
    
    
    
    return true
  }
}
