//
//  MainView.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/10/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var rachio: RachioAPI
    @State var selectedDevice = 0
    
    var devices: [Device] {
        get {
            return rachio.userData.devices.sorted {
                $0.name < $1.name
            }
        }
    }
    
    var body: some View {
        Group {
            LoadingView(isShowing: $rachio.loading) {
                VStack {
                    HStack {
                        DeviceSelector(selectedItem: self.selectedDevice, title: "Controllers", delegate: self)
                        Spacer()
                        Button(action: {
                            self.rachio.refreshDevices()
                        }) {
                                Text("Refresh")
                        }
                        .padding(.trailing)
                    }
                    
                    if self.devices.count > self.selectedDevice {
                        DeviceDetailView(device: self.devices[self.selectedDevice])
                    }
                    
                    Spacer()
                }
            }
            
        }
    }
}

extension MainView: DeviceSelectorDelegate {    
    func numberOfItems() -> Int {
        devices.count
    }
    
    func label(for index: Int) -> String {
        devices[index].name
    }
    
    func selected(at index: Int) {
        self.selectedDevice = index
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(rachio: RachioAPI.shared)
    }
}
