//
//  DummyValues.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

let testSoil = Soil(name: "my_soil")

let testShade = Shade(name: "my_shade")

let testCrop = Crop(name: "my_grass", coefficient: 0.6666666)

let testSlope = Slope(name: "my_slope", sortOrder: 1)

let testNozzle = Nozzle(name: "my_head", inchesPerHour: 0.56333, imageUrl: nil, category: nil)

fileprivate let testZones: [Zone] =
    [
        Zone(id: "id_1", zoneNumber: 1, name: "zone_1", runtime: 30, rootZoneDepth: 4.5, efficiency: 0.13413413, fixedRuntime: 12, imageURL: nil, scheduleDataModified: nil, customShade: testShade, depthOfWater: 0.13, managementAllowedDepletion: 0.666666, customCrop: testCrop, saturatedDepthOfWater: 3, customSoil: testSoil, customNozzle: testNozzle, availableWater: 0.25, yardAreaSquareFeet: 1000, runtimeNoMultiplier: 1399, maxRuntime: 24, enabled: true, lastWateredDate: nil, wateringAdjustmentRuntimes: nil, customSlope: testSlope),
        Zone(id: "id_2", zoneNumber: 1, name: "zone_2", runtime: 30, rootZoneDepth: 4.5, efficiency: 0.13413413, fixedRuntime: 12, imageURL: nil, scheduleDataModified: nil, customShade: testShade, depthOfWater: 0.13, managementAllowedDepletion: 0.666666, customCrop: testCrop, saturatedDepthOfWater: 3, customSoil: testSoil, customNozzle: testNozzle, availableWater: 0.25, yardAreaSquareFeet: 1000, runtimeNoMultiplier: 1399, maxRuntime: 24, enabled: true, lastWateredDate: nil, wateringAdjustmentRuntimes: nil, customSlope: testSlope),
        Zone(id: "id_3", zoneNumber: 1, name: "zone_3", runtime: 30, rootZoneDepth: 4.5, efficiency: 0.13413413, fixedRuntime: 12, imageURL: nil, scheduleDataModified: nil, customShade: testShade, depthOfWater: 0.13, managementAllowedDepletion: 0.666666, customCrop: testCrop, saturatedDepthOfWater: 3, customSoil: testSoil, customNozzle: testNozzle, availableWater: 0.25, yardAreaSquareFeet: 1000, runtimeNoMultiplier: 1399, maxRuntime: 24, enabled: true, lastWateredDate: nil, wateringAdjustmentRuntimes: nil, customSlope: testSlope),
]

fileprivate let testDevices: [Device] =
[
    Device(id: "id_1", name: "device_1", model: "model", on: true, zones: testZones, status: .Online, serialNumber: "snxxx", homeKitCompatible: false, latitude: nil, longitude: nil, createDate: nil, deleted: false, scheduleModeType: "mode", macAddress: nil, scheduleRules: nil),
    Device(id: "id_2", name: "device_2", model: "model", on: true, zones: testZones, status: .Online, serialNumber: "snxxx", homeKitCompatible: false, latitude: nil, longitude: nil, createDate: nil, deleted: false, scheduleModeType: "mode", macAddress: nil, scheduleRules: nil),
    Device(id: "id_3", name: "device_3", model: "model", on: true, zones: testZones, status: .Online, serialNumber: "snxxx", homeKitCompatible: false, latitude: nil, longitude: nil, createDate: nil, deleted: false, scheduleModeType: "mode", macAddress: nil, scheduleRules: nil),
]

let testData = UserData(fullName: "Joe User", devices: testDevices)
