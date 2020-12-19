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
//    ]
    
    var realm: Realm!
    var array: Results<Test>!
    
    override func viewDidLoad() {
        title = "Проверь свое здоровье"
    
        //addTest()
        setupRealm()
        array = realm.objects(Test.self)
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
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }

        destination.testName = String(array[selectedPath.row].name)
        destination.testDescription = String(array[selectedPath.row].desc)
        destination.testIndex = selectedPath.row
    }
    
    func setupRealm() {
        let realmPath = Bundle.main.url(forResource: "compact", withExtension: "realm")!
        let realmConfiguration = Realm.Configuration(fileURL: realmPath, readOnly: true)
        self.realm = try! Realm(configuration: realmConfiguration)
    }

    
//    func addTest() {
//        let qqq = Test()
//        qqq.name = "МИЭФ-5"
//        qqq.countQuestions = 4
//        qqq.desc = "Система суммарной оценки симптомов болезней предстательной железы"
//        qqq.countQuestionsOnAnswer = 4
//        qqq.answers.append(Answer(value: ["Как часто в течение последнего месяца у Вас было ощущение"]))
//        qqq.questions.append(Question(value: ["Никогда", 0]))
//        
//        do {
//            try realm.write {
//                realm.add(qqq)
//            }
//        } catch {
//            print("Error \(error)")
//        }
//    }

    


    
}

