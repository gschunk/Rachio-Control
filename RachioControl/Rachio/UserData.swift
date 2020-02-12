//
//  UserData.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/8/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation
import Combine

struct UserData: Codable {
    var fullName: String
    var devices: [Device]
}
