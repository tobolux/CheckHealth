//
//  QuestionsViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 09.12.2020.
//

import UIKit

class QuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var tableViewAdd: UITableView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var numberAnswer = 0, numberQuestion = 0, scoreTest = 0.0, testIndex = 0, testName = "", test = Test()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.dynamicColor
        
        test = array[testIndex]
        
        answerLabel.text = test.answers[numberAnswer].answer
        
        tableViewAdd.delegate = self
        tableViewAdd.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.answers[numberAnswer].countQuestionsOnAnswer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuestion", for: indexPath)
        tableView.backgroundColor = UIColor.dynamicColor
        cell.backgroundColor = UIColor.dynamicColor
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = test.questions[indexPath.row + numberQuestion].question
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        let testName = test.questions[selectedPath.row + numberQuestion].score

        if test.differentCountOfQuestions {
        numberQuestion += test.answers[numberAnswer].countQuestionsOnAnswer
        }
        
        if self.testName == "FSFI" {
            scoreTest += calcFSFI(answer: numberAnswer, question: selectedPath.row)
        } else {
            scoreTest += Double(testName)
        }
        
        numberAnswer += 1
        
        let totalProgress = Float(numberAnswer) / Float(array[testIndex].answers.count)
        
        if numberAnswer == test.countQuestions {
            self.performSegue(withIdentifier: "toResult", sender: indexPath)
            } else {
                answerLabel.text = test.answers[numberAnswer].answer
                progressView.setProgress(totalProgress, animated: true)

                tableView.reloadData()
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScoreViewController {
            destination.scoreTest = scoreTest
            destination.testName = test.name
        }
     }
    
}
