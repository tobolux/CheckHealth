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
    var testIndex = 0
    
    @IBOutlet weak var testNameLabel: UILabel!
    @IBOutlet weak var testDescriptionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.dynamicColor
        title = testName
        testNameLabel.text = testName
        testDescriptionLabel.text = testDescription
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toQuestions" else { return }
        guard let destination = segue.destination as? QuestionsViewController else { return }
        destination.testName = testName
        destination.testIndex = testIndex
    }

}
