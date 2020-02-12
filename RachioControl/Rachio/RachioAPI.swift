//
//  RachioAPI.swift
//  RachioControl
//
//  Created by Greg Schunk on 2/8/20.
//  Copyright © 2020 Greg Schunk. All rights reserved.
//

import Foundation
import Combine

class RachioAPI: ObservableObject {
    private var apiToken: String?
    
    @Published var user: Person?
    @Published var userData: UserData
    @Published var loading = false
    
    static var shared = RachioAPI()
    
    private init() {
        if let path = Bundle.main.path(forResource: "RachioConfig", ofType: "plist"),
            let appSettings = NSDictionary(contentsOfFile: path),
            let apiToken = appSettings["RachioApiKey"] as? String {
            self.apiToken = apiToken
        } else {
            assertionFailure("API key must be set")
        }
        self.userData = UserData(fullName: "", devices: [Device]())
        startSession()
    }
    
    func startSession() {
        guard let apiToken = apiToken else { return }
        
        loading = true
        
        let urlPath = "https://api.rach.io/1/public/person/info"
        let url = URL(string: urlPath)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Content-Type" : "application/json", "Authorization" : "Bearer " + apiToken]
        
        let downloadTask = URLSession.shared.dataTask(with: request , completionHandler:{ (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let data = data {
                DispatchQueue.main.sync {
                    do {
                        let decoder = JSONDecoder()
                        let user = try decoder.decode(Person.self, from: data)
                        self.user = user
                        self.fetchDevices(for: user)
                    } catch {
                        print(error.localizedDescription)
                        self.user = nil
                        self.userData = UserData(fullName: "", devices: [Device]())
                        self.loading = false
                    }
                }
            }
            else {
                debugPrint("data was nil")
            }
            
        })
        downloadTask.resume()
    }
    
    func refreshDevices() {
        guard let user = user else { return }
        
        fetchDevices(for: user)
    }
    
    private func fetchDevices(for user: Person) {
        guard let apiToken = apiToken else { return }
        
        loading = true
        
        let urlPath = "https://api.rach.io/1/public/person/" + user.id
        let url = URL(string: urlPath)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Content-Type" : "application/json", "Authorization" : "Bearer " + apiToken]
        
        let downloadTask = URLSession.shared.dataTask(with: request , completionHandler:{ (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let data = data {
                DispatchQueue.main.sync {
                    do {
                        let decoder = JSONDecoder()
                        self.userData = try decoder.decode(UserData.self, from: data)                        
                    } catch {
                        print(error.localizedDescription)
                        self.userData = UserData(fullName: "", devices: [Device]())
                    }
                    self.loading = false
                }
            }
            else {
                debugPrint("data was nil")
            }})
        downloadTask.resume()
    }
}
