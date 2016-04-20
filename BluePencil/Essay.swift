//
//  Essay.swift
//  BluePencil
//
//  Created by Moritz Scholz on 10.04.16.
//  Copyright © 2016 mm. All rights reserved.
//

/*
 Class for essays.
 */

import Foundation

class Essay {
  // TODO: Add user ID.
  
  /// Content as an array of EssayParts
  private var content = [EssayPart]()

  /// Date created
  var created = NSDate()
  /// Date last modified
  var lastModified = NSDate()
  
  /// Full text of the essay
  // FIXME: Performance problem?
  var text:String {
    get {
      var s = ""
      for part in self.content {
        s = "\(s)\(part.text)"
      }
      return s
    }
  }
  
  /// Number of parts in essay.
  var partsCount:Int {
    get {
      return content.count
    }
  }
  
  /// Add an EssayPart
  func append(part:EssayPart)  {
    var part = part
    
    // Get range for part which gets appended.
    part.range = NSRange(location: 0, length: part.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    if (content.count > 0) {
      let lastPart = content[content.count-1]
      part.range.location = lastPart.range.location+lastPart.range.length
    }
    
    // FIXME: Remove this
    if (content.count == 5) {
      part.correctedText = "Lorem ipsum dolor sit amet, duis autim vel eum.!"
    }
    
    content.append(part)
  }
  
  /// Get part at index.
  func partAtIndex(idx:Int) -> EssayPart? {
    if (idx < content.count)  {
      return content[idx]
    }
    else {
      return nil
    }
  }
  
  /// Get selected part in essay for position in full text.
  func partAtPosition(pos:Int) -> EssayPart?  {
    if let idx = self.partIndexAtPosition(pos)  {
      return content[idx]
    }
    else {
      return nil
    }
  }
  
  /// Get selected parts index for position in full text.
  func partIndexAtPosition(pos:Int) -> Int? {
    var partIdx:Int?

    // Check if the position lies in one of the parts.
    // TODO: Can be done more efficiently
    for (idx,part) in content.enumerate() {
      if (NSLocationInRange(pos, part.range)) {
        // The selection is in the part at position i.
        partIdx = idx
        break
      }
    }
    
    return partIdx
  }
}

/// Struct for parts of an essay. 
/// Right now every sentence is one part.
struct EssayPart {
  var text:String = ""
  var correctedText:String = ""
  var comment:String = ""
  var range:NSRange = NSRange(location: 0, length: 0)
  
  init(text:String, correctedText:String, comment:String)  {
    self.text = text
    self.correctedText = correctedText
    self.comment = comment
  }
  
  init(text:String)  {
    self.text = text
    self.correctedText = text
    self.comment = ""
  }
}