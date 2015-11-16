//
//  GlobalFiles.swift
//  AquaMaintMain
//
//  Created by Tyler Harfst on 11/16/15.
//  Copyright (c) 2015 Tyler Harfst. All rights reserved.
//

import Foundation

var testHistory: NSMutableArray = []

var ghGraphPoints:[Int] = []
var khGraphPoints:[Int] = []
var phGraphPoints:[Double] = []
var nhGraphPoints:[Int] = []
var nitrateGraphPoints:[Int] = []
var nitriteGraphPoints:[Int] = []

func getGraphPoints() {
    ghGraphPoints = []
    khGraphPoints = []
    phGraphPoints = []
    nhGraphPoints = []
    nitrateGraphPoints = []
    nitriteGraphPoints = []
    
    for (index, element) in enumerate(testHistory) {
        let detail = WaterTest(sent: element as! NSDictionary)
        ghGraphPoints.append(Int(detail.GH))
        khGraphPoints.append(Int(detail.KH))
        phGraphPoints.append(Double(detail.PH))
        nhGraphPoints.append(Int(detail.NH))
        nitrateGraphPoints.append(Int(detail.Nitrate))
        nitriteGraphPoints.append(Int(detail.Nitrite))
    }
    return
}

func avgGH() -> Double {
    var tally: Double = 0.0
    for (index, element) in enumerate(testHistory) {
        let detail = WaterTest(sent: element as! NSDictionary)
        tally += detail.GH
    }
    return round((tally/Double(testHistory.count)) * 100) / 100 as Double
}

func avgKH() -> Double {
    var tally: Double = 0.0
    for (index, element) in enumerate(testHistory) {
        let detail = WaterTest(sent: element as! NSDictionary)
        tally += detail.KH
    }
    return round((tally/Double(testHistory.count)) * 100) / 100 as Double
}

func avgPH() -> Double {
    var tally: Double = 0.0
    for (index, element) in enumerate(testHistory) {
        let detail = WaterTest(sent: element as! NSDictionary)
        tally += detail.PH
    }
    return round((tally/Double(testHistory.count)) * 100) / 100 as Double
}

func avgNH() -> Double {
    var tally: Double = 0.0
    for (index, element) in enumerate(testHistory) {
        let detail = WaterTest(sent: element as! NSDictionary)
        tally += detail.NH
    }
    return round((tally/Double(testHistory.count)) * 100) / 100 as Double
}

func avgNitrate() -> Double {
    var tally: Double = 0.0
    for (index, element) in enumerate(testHistory) {
        let detail = WaterTest(sent: element as! NSDictionary)
        tally += detail.Nitrate
    }
    return round((tally/Double(testHistory.count)) * 100) / 100 as Double
}

func avgNitrite() -> Double {
    var tally: Double = 0.0
    for (index, element) in enumerate(testHistory) {
        let detail = WaterTest(sent: element as! NSDictionary)
        tally += detail.Nitrite
    }
    return round((tally/Double(testHistory.count)) * 100) / 100 as Double
}

extension Double
{
    func format(f: String) -> String
    {
        return NSString(format: "%\(f)f", self) as String
    }
    mutating func roundTo(f: String)
    {
        self = NSString(format: "%\(f)f", self).doubleValue
    }
}

extension String {
    func toDate() -> NSDate
    {
        //Create Date Formatter
        let dateFormatter = NSDateFormatter()
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //Parse into NSDate
        let dateFromString : NSDate! = dateFormatter.dateFromString(self)!
        //Return Parsed Date
        return dateFromString
    }
}

extension NSDate {
    func dateAsString() -> String {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        var dateAsString = dateFormatter.stringFromDate(self)
        return dateAsString
    }
}
