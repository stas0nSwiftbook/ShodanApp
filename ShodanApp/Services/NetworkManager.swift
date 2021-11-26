//
//  NetworkManager.swift
//  ShodanApp
//
//  Created by Станислав Буйновский on 26.11.2021.
//

import Foundation

class NetworkManager {
    
    static func fetchHostSummary(for ip: String, completion: @escaping (HostSummaryInfo?) -> Void) {
        
        let apiPath = "https://api.shodan.io/shodan/host/" + ip + "?key=\(apiKey)"
        
        guard let url = URL(string: apiPath) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let hostSummaryInfo = try JSONDecoder().decode(HostSummaryInfo.self, from: data)
                DispatchQueue.main.async {
                    completion(hostSummaryInfo)
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(nil)
                }
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
