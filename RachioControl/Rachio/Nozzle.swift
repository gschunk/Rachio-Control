//
//  Nozzle.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/8/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

struct Nozzle: Codable, Hashable {
    var name: String
    var inchesPerHour: Double
    var imageUrl: String?
    var category: String?
}

extension Nozzle: CustomStringConvertible {
    var description: String {
        get {
            name.replacingOccurrences(of: "_", with: " ").capitalized(with: Locale.current)
        }
    }
}
