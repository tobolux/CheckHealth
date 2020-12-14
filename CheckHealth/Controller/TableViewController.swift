//
//  TableViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 08.12.2020.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
//    var array = [
//        Test(name: "IPSS", countQuestions: 1, description: "Система суммарной оценки симптомов болезней предстательной железы"),
//        Test(name: "FINDRISK", countQuestions: 10, description: "Для расчёта риска развития сахарного диабета"),
//        Test(name: "CAGE", countQuestions: 20, description: "Для оценки начальной диагностики злоупотребления алкоголем")
//    ]
  
    let realm = try! Realm()
    var array: Results<Test1>!
    
    
    override func viewDidLoad() {
        title = "Проверь свое здоровье"
        
       // addTest()
        array = realm.objects(Test1.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = array[indexPath.row].name
        let detailText = String(array[indexPath.row].countQuestions)
        cell?.detailTextLabel?.text = "Вопросов: \(detailText) "
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toTest" else { return }
        guard let destination = segue.destination as? TestViewController else { return }
        //guard let destination1 = segue.destination as? QuestionsViewController else { return }
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }

        destination.testName = String(array[selectedPath.row].name)
        destination.testDescription = String(array[selectedPath.row].desc)
        destination.testCount = array[selectedPath.row].countQuestionsOnAnswer
    }
    
    func addTest() {
        let qqq = Test1()
        qqq.name = "IPSS"
        qqq.countQuestions = 4
        qqq.desc = "Система суммарной оценки симптомов болезней предстательной железы"
        qqq.countQuestionsOnAnswer = 4
        do {
            try realm.write {
                realm.add(qqq)
            }
        } catch {
            print("Error \(error)")
        }
    }

}

