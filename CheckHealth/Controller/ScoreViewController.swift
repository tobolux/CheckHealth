//
//  ScoreViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 12.12.2020.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var barItem: UINavigationItem!
    
    var scoreTest = 0.0
    var testName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.dynamicColor
        barItem.hidesBackButton = true
        
        switch testName {
        case "Предстательная железа (проблемы мочеиспускания у мужчин)":
            resultLabel.text = resultIPSS(for: scoreTest)
        case "Эректильная функция (эрекция)":
            resultLabel.text = resultMIEF5(for: scoreTest)
        case "Алкогольная зависимость":
            resultLabel.text = resultCAGE(for: scoreTest)
        case "Никотиновая зависимость":
            resultLabel.text = resultFagerstrem(for: scoreTest)
        case "Индекс женской сексуальной функции ":
            resultLabel.text = resultFSFI(for: scoreTest)
        case "Риск сердечно-сосудистых заболеваний":
            resultLabel.text = resultHeartRisk(for: scoreTest)
        case "Хроническая болезнь легких (кашель, одышка)":
            resultLabel.text = resultHobl(for: scoreTest)
        case "Варикозное расширение вен":
            resultLabel.text = resultVien(for: scoreTest)
        case "Бессоница":
            resultLabel.text = resultSon(for: scoreTest)
        case "Память":
            resultLabel.text = resultMemory(for: scoreTest)
        case "Опущение органов таза у женщин":
            resultLabel.text = resultProlaps(for: scoreTest)
        case "Депрессия":
            resultLabel.text = resultDepression(for: scoreTest)
        case "Вероятность инсульта":
            resultLabel.text = resultStroke(for: scoreTest)
        case "Старение у мужчин (снижение тестостерона)":
            resultLabel.text = resultAMS(for: scoreTest)
        case "Старение у женщин (период климакса)":
            resultLabel.text = resultClimax(for: scoreTest)
        case "Риск сахарного диабета":
            resultLabel.text = resultDiabet(for: scoreTest)
        case "Риск развития онкологических заболеваний (общий)":
            resultLabel.text = resultCancer(for: scoreTest)
        case let str where str.contains("Риск рака"):
            resultLabel.text = resultCancerSingle(for: scoreTest)
            
        default:
            resultLabel.text = "Error"
        }
        
    }
    
    @IBAction func goToRootVC(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }



    
    
}
