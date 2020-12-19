//
//  ScoreViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 12.12.2020.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var barItem: UINavigationItem!
    
    var scoreTest = 0
    var testName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barItem.hidesBackButton = true
        print(scoreTest)
        
        switch testName {
        case "IPSS":
            resultLabel.text = resultIPSS(for: scoreTest)
        case "МИЭФ-5":
            resultLabel.text = resultMIEF5(for: scoreTest)
        case "CAGE":
            resultLabel.text = resultCAGE(for: scoreTest)
        default:
            resultLabel.text = "Error"
        }
        
    }
    
    @IBAction func goToRootVC(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }



    
    
}
