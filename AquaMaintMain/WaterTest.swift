//
//  WaterTest.swift
//  AquaMaintMain
//
//  Created by Tyler Harfst on 11/16/15.
//  Copyright (c) 2015 Tyler Harfst. All rights reserved.
//

import UIKit
import Foundation

class WaterTest: NSObject {
    
    var identifier: NSDictionary
    var Date: NSDate
    var GH: Double
    var KH: Double
    var PH: Double
    var NH: Double
    var Nitrate: Double
    var Nitrite: Double
    
    init(sent:NSDictionary) {
        identifier = sent
        Date = identifier["date"] as! NSDate
        GH = identifier["GH"] as! Double
        KH = identifier["KH"] as! Double
        PH = identifier["PH"] as! Double
        NH = identifier["NH"] as! Double
        Nitrate = identifier["Nitrate"] as! Double
        Nitrite = identifier["Nitrite"] as! Double
    }
    
    func cellSubTitle() -> String {
        let subString: String = ("PH: " + PH.description + "     GH: " + GH.description + "    KH: " + KH.description + "     NH: " + NH.description + "\n" + "Nitrate: " + Nitrate.description + "    Nitrite: " + Nitrite.description) as String
        return subString
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
}
