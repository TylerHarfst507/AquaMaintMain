//
//  DetailViewController.swift
//  AquaMaintMain
//
//  Created by Tyler Harfst on 11/16/15.
//  Copyright (c) 2015 Tyler Harfst. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ghLabel: UILabel!
    @IBOutlet weak var khLabel: UILabel!
    @IBOutlet weak var phLabel: UILabel!
    @IBOutlet weak var nhLabel: UILabel!
    @IBOutlet weak var nitrateLabel: UILabel!
    @IBOutlet weak var nitriteLabel: UILabel!
    
    var detailItem: NSDictionary = [:]
    
    @IBAction func deleteButton(sender: UIBarButtonItem) {
        for (index, element) in enumerate(testHistory) {
            let detail = WaterTest(sent: element as! NSDictionary)
            if (element as! NSDictionary == detailItem) {
                testHistory.removeObjectAtIndex(index)
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let detail = WaterTest(sent: detailItem)
        dateLabel.text = (detail.Date as NSDate).dateAsString()
        ghLabel.text = detail.GH.format(".2") + " avg: " + detail.avgGH().description
        khLabel.text = detail.KH.format(".2") + " avg: " + detail.avgKH().description
        phLabel.text = detail.PH.format(".2") + " avg: " + detail.avgPH().description
        nhLabel.text = detail.NH.format(".2") + " avg: " + detail.avgNH().description
        nitrateLabel.text = detail.Nitrate.format(".2") + " avg: " + detail.avgNitrate().description
        nitriteLabel.text = detail.Nitrite.format(".2") + " avg: " + detail.avgNitrite().description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
