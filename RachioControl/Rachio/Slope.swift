//
//  Slope.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/10/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

struct Slope: Codable, Hashable {
    let name: String
    let sortOrder: Int
}

extension Slope: CustomStringConvertible {
    var description: String {
        get {
            return name.replacingOccurrences(of: "_", with: " ").capitalized(with: Locale.current)
        }
    }    
    
}
