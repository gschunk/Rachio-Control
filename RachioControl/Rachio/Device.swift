//
//  Device.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/8/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import SwiftUI

struct Device : Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let model: String
    let on: Bool
    let zones: [Zone]
    let status: DeviceStatus
    let serialNumber: String
    let homeKitCompatible: Bool
    let latitude, longitude: Double?
    let createDate: Int?
    let deleted: Bool?
    let scheduleModeType: String
    let macAddress: String?
    let scheduleRules: [ScheduleRule]?
}
