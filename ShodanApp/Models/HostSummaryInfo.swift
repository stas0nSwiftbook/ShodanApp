//
//  HostSummaryInfo.swift
//  ShodanApp
//
//  Created by Станислав Буйновский on 25.11.2021.
//

import Foundation

struct HostSummaryInfo: Decodable {
    let city: String
    let latitude: Double
    let isp: String
    let longitude: Double
    let last_update: String
    let country_name: String
    let ip_str: String
    let ports: [Int]
    let domains: [String]
    let hostnames: [String]
    
    var description: String {
        """
        ip: \(ip_str)
        isp: \(isp)
        city: \(city)
        country: \(country_name)
        latitude: \(latitude)
        longitude: \(longitude)
        
        last update:
        \(last_update)
        
        ports:
        \(ports.map {String($0)}.joined(separator: "\n"))
        
        domains:
        \(domains.joined(separator: "\n"))
        
        hostnames:
        \(hostnames.joined(separator: "\n"))
        
        """
    }
}

