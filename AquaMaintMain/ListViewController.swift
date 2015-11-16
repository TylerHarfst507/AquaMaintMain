//
//  ListViewController.swift
//  AquaMaintMain
//
//  Created by Tyler Harfst on 11/16/15.
//  Copyright (c) 2015 Tyler Harfst. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewWillAppear(animated: Bool) {
        if testHistory.count < 2 {
            ghGraphPoints = [0, 1, 0]
            khGraphPoints = [0, 1, 0]
            phGraphPoints = [0, 1, 0]
            nhGraphPoints = [0, 1, 0]
            nitrateGraphPoints = [0, 1, 0]
            nitriteGraphPoints = [0, 1, 0]
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = testHistory[indexPath.row] as! NSDictionary
                let destination = segue.destinationViewController as! UINavigationController
                let nextController = destination.topViewController as! DetailViewController
                nextController.detailItem = object
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testHistory.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let current = WaterTest(sent: (testHistory[indexPath.row] as! NSDictionary))
        cell.textLabel?.text = current.Date.dateAsString()
        cell.detailTextLabel?.text = current.cellSubTitle()
        return cell
    }
}
