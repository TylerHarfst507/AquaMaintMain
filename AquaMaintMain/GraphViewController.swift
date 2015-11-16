//
//  GraphViewController.swift
//  AquaMaintMain
//
//  Created by Tyler Harfst on 11/16/15.
//  Copyright (c) 2015 Tyler Harfst. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
    // Graph View Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ghGraphView: GhGraphView!
    @IBOutlet weak var khGraphView: KhGraphView!
    @IBOutlet weak var phGraphView: PhGraphView!
    @IBOutlet weak var nhGraphView: NhGraphView!
    @IBOutlet weak var nitrateGraphView: NitrateGraphView!
    @IBOutlet weak var nitriteGraphView: NitriteGraphView!
    
    // GH Labels
    @IBOutlet weak var ghTitleLabel: UILabel!
    @IBOutlet weak var ghAverageLabel: UILabel!
    @IBOutlet weak var ghMaxLabel: UILabel!
    @IBOutlet weak var ghMinLabel: UILabel!
    // KH Labels
    @IBOutlet weak var khTitleLabel: UILabel!
    @IBOutlet weak var khAverageLabel: UILabel!
    @IBOutlet weak var khMaxLabel: UILabel!
    @IBOutlet weak var khMinLabel: UILabel!
    // PH Labels
    @IBOutlet weak var phTitleLabel: UILabel!
    @IBOutlet weak var phAverageLabel: UILabel!
    @IBOutlet weak var phMaxLabel: UILabel!
    @IBOutlet weak var phMinLabel: UILabel!
    // NH Labels
    @IBOutlet weak var nhTitleLabel: UILabel!
    @IBOutlet weak var nhAverageLabel: UILabel!
    @IBOutlet weak var nhMaxLabel: UILabel!
    @IBOutlet weak var nhMinLabel: UILabel!
    // Nitrate Labels
    @IBOutlet weak var nitrateTitleLabel: UILabel!
    @IBOutlet weak var nitrateAverageLabel: UILabel!
    @IBOutlet weak var nitrateMaxLabel: UILabel!
    @IBOutlet weak var nitrateMinLabel: UILabel!
    // Nitrite Labels
    @IBOutlet weak var nitriteTitleLabel: UILabel!
    @IBOutlet weak var nitriteAverageLabel: UILabel!
    @IBOutlet weak var nitriteMaxLabel: UILabel!
    @IBOutlet weak var nitriteMinLabel: UILabel!
    
    var currentView: UIView = GhGraphView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ghTitleLabel.text = "GH"
        ghAverageLabel.text = avgGH().description
        ghMaxLabel.text = maxElement(ghGraphPoints).description
        ghMinLabel.text = minElement(ghGraphPoints).description
    }
    
    override func viewWillAppear(animated: Bool) {
        updateDisplay()
        if testHistory.count < 2 {
            displayAlertMessage("With less than 2 data points, graph will display sample data.")
        }
        getGraphPoints()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlAction(sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            ghTitleLabel.text = "GH"
            ghAverageLabel.text = avgGH().description
            ghMaxLabel.text = maxElement(ghGraphPoints).description
            ghMinLabel.text = minElement(ghGraphPoints).description
            
            UIView.transitionFromView(currentView,
                toView: ghGraphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
            
            currentView = ghGraphView
        case 1:
            khTitleLabel.text = "KH"
            khAverageLabel.text = avgKH().description
            khMaxLabel.text = maxElement(khGraphPoints).description
            khMinLabel.text = minElement(khGraphPoints).description
            
            UIView.transitionFromView(currentView,
                toView: khGraphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
            currentView = khGraphView
        case 2:
            phTitleLabel.text = "PH"
            phAverageLabel.text = avgPH().description
            phMaxLabel.text = maxElement(phGraphPoints).description
            phMinLabel.text = minElement(phGraphPoints).description
            
            UIView.transitionFromView(currentView,
                toView: phGraphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
            currentView = phGraphView
        case 3:
            nhTitleLabel.text = "NH"
            nhAverageLabel.text = avgNH().description
            nhMaxLabel.text = maxElement(nhGraphPoints).description
            nhMinLabel.text = minElement(nhGraphPoints).description
            
            UIView.transitionFromView(currentView,
                toView: nhGraphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
            currentView = nhGraphView
        case 4:
            nitrateTitleLabel.text = "Nitrate"
            nitrateAverageLabel.text = avgNitrate().description
            nitrateMaxLabel.text = maxElement(nitrateGraphPoints).description
            nitrateMinLabel.text = minElement(nitrateGraphPoints).description
            
            UIView.transitionFromView(currentView,
                toView: nitrateGraphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
            currentView = nitrateGraphView
        case 5:
            nitriteTitleLabel.text = "Nitrite"
            nitriteAverageLabel.text = avgNitrite().description
            nitriteMaxLabel.text = maxElement(nitriteGraphPoints).description
            nitriteMinLabel.text = minElement(nitriteGraphPoints).description
            
            UIView.transitionFromView(currentView,
                toView: nitriteGraphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
            currentView = nitriteGraphView
        default:
            ghTitleLabel.text = "GH"
            ghAverageLabel.text = avgGH().description
            ghMaxLabel.text = maxElement(ghGraphPoints).description
            ghMinLabel.text = minElement(ghGraphPoints).description
            
            UIView.transitionFromView(currentView,
                toView: ghGraphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
            currentView = ghGraphView
        }
    }
    
    func updateDisplay() {
        ghGraphView.graphPoints = ghGraphPoints
        ghGraphView.setNeedsDisplay()
        khGraphView.graphPoints = khGraphPoints
        khGraphView.setNeedsDisplay()
        phGraphView.graphPoints = phGraphPoints
        phGraphView.setNeedsDisplay()
        nhGraphView.graphPoints = nhGraphPoints
        nhGraphView.setNeedsDisplay()
        nitrateGraphView.graphPoints = nitrateGraphPoints
        nitrateGraphView.setNeedsDisplay()
        nitriteGraphView.graphPoints = nitriteGraphPoints
        nitriteGraphView.setNeedsDisplay()
    }
    
    func arithmeticMean(numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    func displayAlertMessage(userMessage:String) {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
