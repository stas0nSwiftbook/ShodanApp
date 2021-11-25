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
        NetworkManager.fetchHostSummary(for: ip) { resultString in
            DispatchQueue.main.async {
                self.responseLabel.text = resultString
            }
        }
    }
    
    @IBAction func ipTextFieldChanged(_ sender: UITextField) {
        ip = sender.text ?? ""
    }
}
