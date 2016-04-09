//
//  FeedCell.swift
//  BluePencil
//
//  Created by Moritz Scholz on 27.03.16.
//  Copyright © 2016 mm. All rights reserved.
//

/*
 Custom UITableViewCell in the feedView.
 Shows the `title`, a `previewText` for the post and a `profilePicture` of the user who created it.
 */

import UIKit

class FeedTableViewCell:UITableViewCell  {
  
  /// Profile picture of the user.
  @IBOutlet weak var profilePicture: UIImageView!
  /// Title of the essay.
  @IBOutlet weak var title: UILabel!
  /// Preview text for the essay.
  /// Preview text for the essay.
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