//
//  DeviceDetailView.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import SwiftUI

struct DeviceDetailView: View {
    var device: Device?
    
    var body: some View {
        Group {            
            if device != nil {
                VStack(alignment: .leading) {
                    DeviceDataView(device: device!)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16) .stroke(Color(UIColor.systemGray), lineWidth: 2.0)
                    )
                        ZoneListView(zones: device!.zones) .clipShape(RoundedRectangle(cornerRadius: 16.0))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16) .stroke(Color(UIColor.systemGray), lineWidth: 2.0)
                        )
                }
                .padding()
            }
        }
    }
}

struct DeviceView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDetailView(device: testData.devices[0])
    }
}
