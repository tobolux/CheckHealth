//
//  TableViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 08.12.2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    let items = array.sorted(by: ["group", "name"])
    var sectionNames: [String] {
        return Set(items.value(forKeyPath: "group") as! [String]).sorted()
      }
    
    override func viewDidLoad() {
        title = "Проверь свое здоровье"
    }
    
    @IBAction func aboutItemPressed(_ sender: UIBarButtonItem) {}
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.filter("group == %@", sectionNames[section]).count
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = UIColor.dynamicColorHeader
        headerView.textLabel?.textColor = .white
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        tableView.backgroundColor = UIColor.dynamicColor
        cell.backgroundColor = UIColor.dynamicColor
        cell.textLabel?.numberOfLines = 0
        
        let view = UIView()
        view.backgroundColor = UIColor.dynamicColorHeader
        cell.selectedBackgroundView = view
        
        let path = items.filter("group == %@", sectionNames[indexPath.section])[indexPath.row]
        cell.textLabel?.text = path.name
        let detailText = path.countQuestions
        cell.detailTextLabel?.text = "Вопросов: \(detailText)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toTest" else { return }
        guard let destination = segue.destination as? TestViewController else { return }
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }

        let path = items.filter("group == %@", sectionNames[selectedPath.section])[selectedPath.row]
        destination.testName = String(path.name)
        destination.testDescription = String(path.desc)
        destination.testIndex = items.filter("group == %@", sectionNames[selectedPath.section])[selectedPath.row].id
    }
    

}




