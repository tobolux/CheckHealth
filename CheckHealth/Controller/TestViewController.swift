//
//  TestViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 08.12.2020.
//

import UIKit

class TestViewController: UIViewController {

    var testName = ""
    var testDescription = ""
    
    @IBOutlet weak var testNameLabel: UILabel!
    @IBOutlet weak var testDescriptionLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = testName
        
        testNameLabel.text = testName
        testDescriptionLabel.text = testDescription
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
    }
    

}
