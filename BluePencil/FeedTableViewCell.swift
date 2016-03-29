//
//  FeedCell.swift
//  BluePencil
//
//  Created by Moritz Scholz on 27.03.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class FeedTableViewCell:UITableViewCell  {
  
  @IBOutlet weak var profilePicture: UIImageView!
  @IBOutlet weak var previewText: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Init code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state.
  }
  
}