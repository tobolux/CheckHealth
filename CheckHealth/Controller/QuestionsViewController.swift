//
//  QuestionsViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 09.12.2020.
//

import UIKit
import RealmSwift

class QuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var tableViewAdd: UITableView!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    var numberAnswer = 0, numberQuestion = 0, scoreTest = 0, testIndex = 0, testName = ""
    var realm: Realm!
    var array: Results<Test>!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRealm()
        array = realm.objects(Test.self)
        
        answerLabel.text = array[testIndex].answers[numberAnswer].answer
        
        
        tableViewAdd.delegate = self
        tableViewAdd.dataSource = self
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array[testIndex].countQuestionsOnAnswer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuestion", for: indexPath)
        cell.textLabel?.text = array[testIndex].questions[indexPath.row + numberQuestion].question
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        let testName = array[testIndex].questions[selectedPath.row + numberQuestion].score
    
        numberAnswer += 1
        scoreTest += testName
        
        let totalProgress = Float(numberAnswer) / Float(array[testIndex].answers.count)
        
        if numberAnswer == array[testIndex].countQuestions {
            self.performSegue(withIdentifier: "toResult", sender: indexPath)
            } else {
                //numberQuestion += 4
                answerLabel.text = array[testIndex].answers[numberAnswer].answer
                progressView.setProgress(totalProgress, animated: true)

                
                tableView.reloadData()
                
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScoreViewController {
            destination.scoreTest = scoreTest
            destination.testName = array[testIndex].name
        }
     }
    
    func setupRealm() {
        let realmPath = Bundle.main.url(forResource: "compact", withExtension: "realm")!
        let realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: true)
        self.realm = try! Realm(configuration: realmConfiguration)
    }

    
}
