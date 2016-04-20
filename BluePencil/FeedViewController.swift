//
//  FeedViewController.swift
//  BluePencil
//
//  Created by Moritz Scholz on 27.03.16.
//  Copyright © 2016 mm. All rights reserved.
//

/*
 ViewController for the feedView. 
 Contains a UITableView with a list of the posts displayed in custom FeedTableViewCell-cells.
 */
// TODO: Align preview text on top of label (so the space to the headline is always the same)

import UIKit

class FeedViewController: UITableViewController {
  // TODO: temporary data for the feedView.
  var tableViewTitles = ["Angry man screams at clouds", "いい加減にしろ！！", "Das Bild hängt schief."]
  var tableViewData = ["Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.", "背伸びした少女から大人の女性へ――。２６日公開の「無伴奏」で、成海璃子（２３）が、学生運動が盛んだった１９７０年代前後に多感な青春を送った学生を演じた。大人っぽい容姿とクールなまなざしをいかした役が多かったが、今作では同じ年代の等身大の女性を演じた。", "Als Zarathustra dreissig Jahr alt war, verliess er seine Heimat und den See seiner Heimat und ging in das Gebirge. Hier genoss er seines Geistes und seiner Einsamkeit und wurde dessen zehn Jahr nicht müde. Endlich aber verwandelte sich sein Herz, - und eines Morgens stand er mit der Morgenröthe auf, trat vor die Sonne hin und sprach zu ihr also:"]
  
  var selectedEssayTitle = ""
  
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
  // Configure "skip"-slide functionality for cells.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true;
  }
  
  override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    return .Delete
  }
  
  override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
    return "Skip"
  }
  
  // Handle push of skip-button.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if (editingStyle == .Delete)  {
      print("Skip button pushed!")
      tableViewTitles.removeAtIndex(indexPath.row)  // TODO: Change to real data.
      tableViewData.removeAtIndex(indexPath.row)  // TODO: Change to real data.
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    selectedEssayTitle = tableViewTitles[indexPath.row] // TODO: Change to real data
  }
  
  // MARK: TableViewDataSource-methods
  // There are no sections in the tableview, return 1.
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  //
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewData.count
  }
  
  // Dequeue and return cell.
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let feedCellIdentifier = "feedCell"
    let cell = tableView.dequeueReusableCellWithIdentifier(feedCellIdentifier, forIndexPath: indexPath) as! FeedTableViewCell

    cell.title.text = tableViewTitles[indexPath.row]
    cell.previewText.text = tableViewData[indexPath.row]
    
    return cell
  }
  
  // MARK: Flow Control
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier == "EssayCorrectSegue") {
      // Will proceed to correctionView.
      let correctView = segue.destinationViewController as! EssayCorrectViewController
      correctView.essayTitle = selectedEssayTitle
    }
  }
  
}

