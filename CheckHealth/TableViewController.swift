//
//  TableViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 08.12.2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array = [
        Test(name: "XXX", countQuestions: 1),
        Test(name: "YYY", countQuestions: 10),
        Test(name: "ZZZ", countQuestions: 20)
    ]
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = array[indexPath.row].name
        let detailText = String(array[indexPath.row].countQuestions)
        cell?.detailTextLabel?.text = "\(detailText) вопросов"
        return cell!
    }

}
