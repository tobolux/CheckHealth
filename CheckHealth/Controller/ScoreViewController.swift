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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barItem.hidesBackButton = true
        resultLabel.text = "Вы здоровы, ваш балл \(scoreTest)"
        
    }
    


    @IBAction func goToRootVC(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    
}
