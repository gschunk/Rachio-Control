//
//  ZoneRule.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

struct ZoneRule: Codable, Hashable {
    let zoneID: String
    let duration: Int
    let sortOrder: Int

    enum CodingKeys: String, CodingKey {
        case zoneID = "zoneId"
        case duration, sortOrder
    }
}
