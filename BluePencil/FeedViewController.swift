//
//  FeedViewController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 27.03.16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {
  let tableViewData = ["Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.", "背伸びした少女から大人の女性へ――。２６日公開の「無伴奏」で、成海璃子（２３）が、学生運動が盛んだった１９７０年代前後に多感な青春を送った学生を演じた。大人っぽい容姿とクールなまなざしをいかした役が多かったが、今作では同じ年代の等身大の女性を演じた。", "Als Zarathustra dreissig Jahr alt war, verliess er seine Heimat und den See seiner Heimat und ging in das Gebirge. Hier genoss er seines Geistes und seiner Einsamkeit und wurde dessen zehn Jahr nicht müde. Endlich aber verwandelte sich sein Herz, - und eines Morgens stand er mit der Morgenröthe auf, trat vor die Sonne hin und sprach zu ihr also:"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    print("FeedViewController loaded")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: TableViewDelegate-methods
  
  // MARK: TableViewDataSource-methods
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewData.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let feedCellIdentifier = "feedCell"
    let cell = tableView.dequeueReusableCellWithIdentifier(feedCellIdentifier, forIndexPath: indexPath) as! FeedTableViewCell
    cell.previewText.text = tableViewData[indexPath.row]
    
    return cell
    
    
  }
  
}

