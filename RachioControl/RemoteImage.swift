//
//  RemoteImage.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/9/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation
import Combine
import UIKit

class RemoteImage: ObservableObject {
    @Published var image = UIImage()
    
    init (imageUrl: String?) {
        guard let imageUrl = imageUrl,
            let url = URL(string: imageUrl) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.sync {
                if let image = UIImage(data: data) {
                    self.image = image
                }
                else {
                    self.image = UIImage()
                }
            }
        }
        
        dataTask.resume()
    }
}
