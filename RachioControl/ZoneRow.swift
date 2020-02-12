//
//  ZoneRow.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import SwiftUI


struct ZoneRow: View {
    var zone: Zone
    @ObservedObject var remoteImageURL: RemoteImage
    
    private let formatter: ZoneFormatter
    
    init(zone: Zone) {
        self.zone = zone
        formatter = ZoneFormatter(zone: zone)
        
        remoteImageURL = RemoteImage(imageUrl: zone.imageURL)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                if zone.enabled {
                    Image(uiImage: remoteImageURL.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 2.0))
                } else {
                    Image(uiImage: UIImage(named: "ZoneDisabled")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 2.0))
                }
                Text("\(zone.name)")
                    .font(.headline)
            }
            
            Text("\(zone.customCrop.name)")
                .font(.subheadline)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(zone.customSoil.description)")
                    Text("\(zone.customShade.description)")
                    Text("\(zone.customSlope.description)")
                    Text("\(formatter.yardAreaSquareFoot) sf")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("\(zone.customNozzle.description)")
                    Text("Efficiency: \(formatter.efficiency)")
                    Text("\(formatter.inchesPerHour)")
                }
            }
            .font(.caption)
        }
    }
}

struct ZoneListItem_Previews: PreviewProvider {
    static var previews: some View {
        ZoneRow(zone: testData.devices[0].zones[0])
    }
}


