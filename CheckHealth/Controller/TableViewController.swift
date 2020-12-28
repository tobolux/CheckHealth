//
//  TableViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 08.12.2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        title = "Проверь свое здоровье"
            
        //updateSchemaVersion()
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
    
    /*
    Терапевтические тесты
    Сердце и сосуды
    Женское здоровье
    Мужское здоровье
    Психическое здоровье
    Оценка рисков онкологии
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toTest" else { return }
        guard let destination = segue.destination as? TestViewController else { return }
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }

        destination.testName = String(array[selectedPath.row].name)
        destination.testDescription = String(array[selectedPath.row].desc)
        destination.testIndex = selectedPath.row
    }
    

}


