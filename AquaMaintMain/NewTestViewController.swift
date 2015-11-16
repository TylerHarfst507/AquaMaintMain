//
//  NewTestViewController.swift
//  AquaMaintMain
//
//  Created by Tyler Harfst on 11/16/15.
//  Copyright (c) 2015 Tyler Harfst. All rights reserved.
//

import UIKit

class NewTestViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var inputDate: UIDatePicker!
    @IBOutlet weak var inputGH: UITextField!
    @IBOutlet weak var inputKH: UITextField!
    @IBOutlet weak var inputPH: UITextField!
    @IBOutlet weak var inputNH: UITextField!
    @IBOutlet weak var inputNitrate: UITextField!
    @IBOutlet weak var inputNitrite: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    @IBAction func saveButton(sender: UIBarButtonItem) {
        updateTestHistory()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateTestHistory() {
        var date: NSDate = inputDate.date
        var GH: Double = (inputGH.text as NSString).doubleValue
        var KH: Double = (inputKH.text as NSString).doubleValue
        var PH: Double = (inputPH.text as NSString).doubleValue
        var NH: Double = (inputNH.text as NSString).doubleValue
        var Nitrate: Double = (inputNitrate.text as NSString).doubleValue
        var Nitrite: Double = (inputNitrite.text as NSString).doubleValue
        
        let waterTest = [ "date" : date, "GH" : GH, "KH" : KH, "PH" : PH, "NH" : NH, "Nitrate" : Nitrate, "Nitrite" : Nitrite]
        
        testHistory.addObject(waterTest)
        getGraphPoints()
    }
}
