//
//  DeviceSelector.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/11/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import SwiftUI

struct DeviceSelector: View  {
    @State var selectedItem = 0
    @State private var expanded = false
    
    var title: String
    var delegate: DeviceSelectorDelegate
    
    var body: some View {
        Button(action: {
            self.expanded.toggle()
        }) {
            VStack(alignment: .leading) {
                HStack {
                    if expanded {
                        Image(systemName: "chevron.down")
                    } else {
                        Image(systemName: "chevron.right")
                    }
                    Text("\(title)")
                }
                if expanded {
                    ForEach(0..<delegate.numberOfItems()) { index in
                        SelectionItem(label: self.delegate.label(for: index), selected: index == self.selectedItem, delegate: self, index: index)
                            .padding(.top)
                            .padding(.leading, 36.0)
                    }
                }
            }
        }
        .padding()
        .foregroundColor(Color(UIColor.label))
    }
}

protocol DeviceSelectorDelegate {
    func numberOfItems() -> Int
    func label(for index: Int) -> String
    func selected(at index: Int)
}

extension DeviceSelector: ItemSelectedDelegate {
    func selected(at index: Int) {
        selectedItem = index
        expanded = false
        delegate.selected(at: index)
    }
}

struct DeviceSelector_Previews: PreviewProvider {
    static var previews: some View {
        DeviceSelector(title: "Controllers", delegate: DummyDelegate())
    }
}

fileprivate protocol ItemSelectedDelegate {
    func selected(at index: Int)
}

fileprivate struct SelectionItem: View {
    var label: String
    var selected: Bool
    var delegate: ItemSelectedDelegate
    var index: Int
    
    var body: some View {
        Button(action: {
            self.delegate.selected(at: self.index)
        }) {
            VStack {
                HStack {
                    Text(label)
                    if selected {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

fileprivate struct DummyDelegate: DeviceSelectorDelegate {
    func numberOfItems() -> Int {
        testData.devices.count
    }
    
    func label(for index: Int) -> String {
        testData.devices[index].name
    }
    
    func selected(at index: Int) {
        debugPrint("Selected at \(index)")
    }
}
