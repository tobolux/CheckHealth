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
    
    var numberAnswer = 0
    var numberQuestion = 0
    var scoreTest = 0
    
    var answerArray: Results<Answer>!
    var questionArray: Results<Question>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //  addAnswer()
      //  addQuestion()
        loadObjects()
        
        asnwerLabel.text = answerArray[numberAnswer].answer
        tableViewAdd.delegate = self
        tableViewAdd.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuestion", for: indexPath)

        cell.textLabel?.text = questionArray[indexPath.row + numberQuestion].question
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        let testName = questionArray[selectedPath.row + numberQuestion].score
        scoreTest += testName
        print(scoreTest)
        
        numberAnswer += 1
        numberQuestion += 4
        asnwerLabel.text = answerArray[numberAnswer].answer
        
        if numberAnswer == array. {
        self.performSegue(withIdentifier: "toResult", sender: indexPath)
        }
        
        tableView.reloadData()
         
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         guard let selectedPath = sender as? IndexPath else {
//            return
//         }
//         if segue.identifier == "toResult", let vc = segue.destination as? ScoreViewController {
//           // vc.playerImage = UIImageView(image: UIImage(named: "userIcon"))
//           // vc.currentRankingLabel.text = String(player.ranking)
//           // vc.scoreLabel.text = String("\(player.wins) - \(player.losses)")
//         }
//    }

    
    func addAnswer() {
        let qqq = Answer()
        qqq.answer = "Answer 1"
        qqq.totalAnswer = 4
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
        qqq.question = "iQuestion 1"
        qqq.score = 1
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
        
      //  tableView!.reloadData()
    }
}
