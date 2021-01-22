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
    
    var scoreTest = 0.0
    var testName: String = ""
    var link = "Источник теста"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.dynamicColor
        barItem.hidesBackButton = true
        resultLabel.text = resultText(name: testName, score: scoreTest)
        link = resultLink(name: testName)
    }
    
    @IBAction func goToRootVC(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func linkOpen(_ sender: UIButton) {
        if let url = URL(string: link) {
          UIApplication.shared.open(url)
        } else {
          print("Неправильная ссылка")
        }
    }
    
}
