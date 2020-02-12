//
//  DeviceStatus.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

enum DeviceStatus: String, Codable, Hashable {
    case Online = "ONLINE"
    case Offline = "OFFLINE"
}

extension DeviceStatus: CustomStringConvertible {
    var description: String {
        return self.rawValue.capitalized(with: Locale.current)
    }
}
