//
//  Person.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation

struct Person: Codable {
    let id: String
    let email, username: String?
    let devices: [Device]?
    let createDate: Int?
    let deleted: Bool?
    let fullName: String?
}
