//
//  ZoneFormatter.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

struct ZoneFormatter {
    var zone: Zone
    
    var efficiency: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .percent
            numberFormatter.maximumFractionDigits = 0
            return numberFormatter.string(from: NSNumber(value: zone.efficiency)) ?? ""
        }
    }
    
    var yardAreaSquareFoot: String {
        get {
            if let value = zone.yardAreaSquareFeet {
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                numberFormatter.maximumFractionDigits = 2
                return numberFormatter.string(from: NSNumber(value: value)) ?? ""
            }
            else {
                return ""
            }
        }
    }
    
    var inchesPerHour: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 2
            if let valueString = numberFormatter.string(from: NSNumber(value: zone.customNozzle.inchesPerHour)) {
                return "\(valueString) in/hr"
            }
            
            return ""
        }
    }
}
