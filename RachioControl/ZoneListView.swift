//
//  ZoneListView.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import SwiftUI

struct ZoneListView: View {
    var zones: [Zone]
    
    var body: some View {
            List {
                ForEach(zones.sorted { $0.name < $1.name }) { zone in
                       ZoneRow(zone: zone)
                }
            }
    }
}

struct ZoneListView_Previews: PreviewProvider {
    static var previews: some View {
        ZoneListView(zones: testData.devices[0].zones)
    }
}
