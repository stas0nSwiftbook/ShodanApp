//
//  ViewController.swift
//  ShodanApp
//
//  Created by Станислав Буйновский on 25.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var responseLabel: UILabel!
    
    private let networkManager = NetworkManager()
    private var ip = ""
    
    @IBAction func checkButtonTap(_ sender: UIButton) {
        networkManager.fetchHostSummary(for: ip) { [weak self] summaryInfo in
            guard let self = self else { return }
            self.updateLabel(with: summaryInfo)
        }
    }
    
    @IBAction func ipTextFieldChanged(_ sender: UITextField) {
        ip = sender.text ?? ""
    }
    
    private func updateLabel(with info: HostSummaryInfo?) {
        if let summaryString = info?.description {
            self.responseLabel.text = summaryString
        } else {
            self.responseLabel.text = "No information for your input."
        }

    }
}
