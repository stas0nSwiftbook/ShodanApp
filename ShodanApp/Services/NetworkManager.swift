//
//  NetworkManager.swift
//  ShodanApp
//
//  Created by Станислав Буйновский on 26.11.2021.
//

import Foundation

class NetworkManager {
    
    static func fetchHostSummary(for ip: String, completion: @escaping (String) -> Void) {
        
        let apiPath = "https://api.shodan.io/shodan/host/" + ip + "?key=7lzfRTlxRZeRAvcAXQA3IpFpCvifhB7D"
        
        guard let url = URL(string: apiPath) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let hostSummaryInfo = try JSONDecoder().decode(HostSummaryInfo.self, from: data)
                completion(hostSummaryInfo.description)
            
            } catch let error {
                completion("No information for this input")
                print(error.localizedDescription)
            }
        }.resume()
    }
}