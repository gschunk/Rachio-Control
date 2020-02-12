//
//  Zone.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/8/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

struct Zone: Codable, Identifiable, Hashable {
    let id: String
    let zoneNumber: Int
    let name: String
    let runtime: Int?
    let rootZoneDepth: Double?
    let efficiency: Double
    let fixedRuntime: Int?
    let imageURL: String?
    let scheduleDataModified: Bool?
    let customShade: Shade
    let depthOfWater, managementAllowedDepletion: Double?
    let customCrop: Crop
    let saturatedDepthOfWater: Double?
    let customSoil: Soil
    let customNozzle: Nozzle
    let availableWater: Double?
    let yardAreaSquareFeet, runtimeNoMultiplier, maxRuntime: Int?
    let enabled: Bool
    let lastWateredDate: Int?
    let wateringAdjustmentRuntimes: [String: Int]?
    let customSlope: Slope

    enum CodingKeys: String, CodingKey {
        case zoneNumber, runtime, id, rootZoneDepth, efficiency, fixedRuntime
        case imageURL = "imageUrl"
        case scheduleDataModified, customShade, depthOfWater, managementAllowedDepletion, customCrop, saturatedDepthOfWater, customSoil, customNozzle, availableWater, yardAreaSquareFeet, runtimeNoMultiplier, maxRuntime, name, enabled, lastWateredDate, wateringAdjustmentRuntimes, customSlope
    }
}
