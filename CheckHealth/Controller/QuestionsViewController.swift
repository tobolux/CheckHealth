//
//  QuestionsViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 09.12.2020.
//

import UIKit
import RealmSwift

class QuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var asnwerLabel: UILabel!
    @IBOutlet weak var tableViewAdd: UITableView!
    
    let realm = try! Realm()
    
    var numberAnswer = 0, numberQuestion = 0, scoreTest = 0, testCount: Int = 0, testName = ""
    
    var answerArray: Results<Answer>!
    var questionArray: Results<Question>!
    var array: Results<Test>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //addAnswer()
        //addQuestion()
        loadObjects()
        
        asnwerLabel.text = answerArray[numberAnswer].answer

        tableViewAdd.delegate = self
        tableViewAdd.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuestion", for: indexPath)

 
        cell.textLabel?.text = questionArray[indexPath.row + numberQuestion].question
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        let testName = questionArray[selectedPath.row + numberQuestion].score
        
        if numberAnswer == testCount {
            scoreTest += testName
            self.performSegue(withIdentifier: "toResult", sender: indexPath)
            } else {
                scoreTest += testName
                numberAnswer += 1
                //numberQuestion += 4
                asnwerLabel.text = answerArray[numberAnswer].answer

                tableView.reloadData()
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScoreViewController {
            destination.scoreTest = scoreTest
            destination.testName = testName
        }
     }

    func addAnswer() {
        let qqq = Answer()
        qqq.answer = "1. Как часто в течение последнего месяца у Вас было ощущение неполного опорожнения мочевого пузыря после мочеиспускания?"
        do {
            try realm.write {
                realm.add(qqq)
            }
        } catch {
            print("Error \(error)")
        }
    }
    
    func addQuestion() {
        let qqq = Question()
        qqq.question = "Никогда"
        qqq.score = 0
        do {
            try realm.write {
                realm.add(qqq)
            }
        } catch {
            print("Error \(error)")
        }
    }
    
    func loadObjects() {
        
        answerArray = realm.objects(Answer.self)
        questionArray = realm.objects(Question.self)
        array = realm.objects(Test.self)
        
      //  tableView!.reloadData()
    }
}
