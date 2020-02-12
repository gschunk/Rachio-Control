//
//  DeviceDataView.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/10/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import SwiftUI

struct DeviceDataView: View {
    var device: Device
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("Controller Name: \(device.name)")
                    .font(.headline)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Model: \(device.model)")
                        Text("State: \(device.on ? "On" : "Off")")
                        Text("Status: \(device.status.description)")
                        Text("HomeKit: \(device.homeKitCompatible ? "Yes" : "No")")
                        Text("Schedule Mode: \(device.scheduleModeType.capitalized(with: Locale.current))")
                    }
                    .font(.subheadline)
                    Spacer()
                }
            }
            .padding()
    }
}

struct DeviceDataView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDataView(device: testData.devices[0])
    }
}
