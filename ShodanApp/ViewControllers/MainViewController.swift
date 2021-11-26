//
//  ViewController.swift
//  ShodanApp
//
//  Created by Станислав Буйновский on 25.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var responseLabel: UILabel!
    
    private var ip = ""
    
    @IBAction func checkButtonTap(_ sender: UIButton) {
        NetworkManager.fetchHostSummary(for: ip) { hostSummaryInfo in
            if let summaryString = hostSummaryInfo?.description {
                self.responseLabel.text = summaryString
            } else {
                self.responseLabel.text = "No information for your input."
            }
        }
    }
    
    @IBAction func ipTextFieldChanged(_ sender: UITextField) {
        ip = sender.text ?? ""
    }
}
