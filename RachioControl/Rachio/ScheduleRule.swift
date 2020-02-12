//
//  ScheduleRule.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

struct ScheduleRule: Codable, Hashable {
    let id: String
    let name: String
    let zones: [ZoneRule]
    let scheduleJobTypes: [String]?
    let scheduleRuleOperator: String?
    let cycleSoakStatus: String?
    let startDate: Int?
    let enabled: Bool?
    let startDay, startMonth, startYear, totalDuration: Int?
    let endDate: Int?
    let etSkip: Bool?
    let externalName: String?
    let cycleSoak: Bool?

    enum CodingKeys: String, CodingKey {
        case id, zones, scheduleJobTypes
        case scheduleRuleOperator = "operator"
        case cycleSoakStatus, startDate, name, enabled, startDay, startMonth, startYear, totalDuration, endDate, etSkip, externalName, cycleSoak
    }
}
