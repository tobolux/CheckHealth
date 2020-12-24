//
//  TableViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 08.12.2020.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var realm: Realm!
    var array: Results<Test>!
    
    override func viewDidLoad() {
        title = "Проверь свое здоровье"
     
        setupRealm()
        array = realm.objects(Test.self)
    }
    
    @IBAction func aboutItemPressed(_ sender: UIBarButtonItem) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        tableView.backgroundColor = UIColor.dynamicColor
        cell?.backgroundColor = UIColor.dynamicColor
        
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = array[indexPath.row].name
        let detailText = String(array[indexPath.row].countQuestions)
        cell?.detailTextLabel?.text = "Вопросов: \(detailText)"
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

    
}


