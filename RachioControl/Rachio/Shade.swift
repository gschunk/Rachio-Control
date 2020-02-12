//
//  Shade.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

struct Shade: Codable, Hashable {
    let name: String
}

extension Shade: CustomStringConvertible {
    var description: String {
        get {
            return name.replacingOccurrences(of: "_", with: " ").capitalized(with: Locale.current)
        }
    }
}
