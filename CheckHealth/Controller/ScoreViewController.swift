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
    var link = "Источник теста"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.dynamicColor
        barItem.hidesBackButton = true
        
        switch testName {
        case "Индекс женской сексуальной функции ":
            resultLabel.text = resultFSFI(for: scoreTest)
            link = "https://dr-arabin.ru/pacientam/opredelenie-indeksa-zhenskoj-seksualnosti-fsfi.html"
        case "Опущение органов таза у женщин":
            resultLabel.text = resultProlaps(for: scoreTest)
            link = "https://dr-arabin.ru/pacientam/test-rannej-diagnostiki-prolapsa-organov-malogo-taza.html "
        case "Старение у женщин (период климакса)":
            resultLabel.text = resultClimax(for: scoreTest)
            link = "https://mama-clinic.ru/otsenite-est-li-u-vas-klimaks"
        case "Предстательная железа (проблемы мочеиспускания у мужчин)":
            resultLabel.text = resultIPSS(for: scoreTest)
            link = "https://angiohelp.ru/embolizatsiya/oprosnik-ipss.html"
        case "Старение у мужчин (снижение тестостерона)":
            resultLabel.text = resultAMS(for: scoreTest)
            link = "https://genesis-clinic.ru/uslugi/andrologiya/ams-oprosnik-vozrastnykh-simptomov-muzhchiny/"
        case "Эректильная функция (эрекция)":
            resultLabel.text = resultMIEF5(for: scoreTest)
            link = "https://klinikaluc.lv/mief5.html"
        case "Риск развития онкологических заболеваний (общий)":
            resultLabel.text = resultCancer(for: scoreTest)
            link = "http://slobodskoy.medkirov.ru/site/LSPEF0804/$file/%D0%B3%D0%B0%D0%B7%D0%B5%D1%82%D0%B0%204.compressed.pdf"
        case let str where str.contains("Риск рака"):
            resultLabel.text = resultCancerSingle(for: scoreTest)
            link = "https://www.rkdc.ru/meditsinskaya-profilaktika-statii/profilaktika_drugih_infesiy/anketa-po-ocenke-riska-razvitiya-zlokachestvennyh-novoobrazovaniy-po-organam-i-sistemam/"
        case "Алкогольная зависимость":
            resultLabel.text = resultCAGE(for: scoreTest)
            link = "http://www.medpsy.ru/dictionary/metod_12_005.php"
        case "Никотиновая зависимость":
            resultLabel.text = resultFagerstrem(for: scoreTest)
            link = "https://mosgorzdrav.ru/ru-RU/test/default/card/1.html"
        case "Бессоница":
            resultLabel.text = resultSon(for: scoreTest)
            link = "https://memini.ru/tests/24873"
        case "Депрессия":
            resultLabel.text = resultDepression(for: scoreTest)
            link = "http://clinica.nsk.ru/info/testy/testy-na-stressy-depressiyu-trevozhnost/shkala-depressii-beka-test-oprosnik/"
        case "Память":
            resultLabel.text = resultMemory(for: scoreTest)
            link = "https://rgnkc.ru/proverka-pamiati"
        case "Варикозное расширение вен":
            resultLabel.text = resultVien(for: scoreTest)
            link = "https://www.phleboscience.ru/background/Poleznie-stati/naskolko-vysoka-vasha-predraspolojennost-k-varikozu/"
        case "Вероятность инсульта":
            resultLabel.text = resultStroke(for: scoreTest)
            link = "http://www.121kdp.ru/jsppages/narushenie-mozgovogo-krovoobrasheniya-anketa-celt-.html"
        case "Риск сердечно-сосудистых заболеваний":
            resultLabel.text = resultHeartRisk(for: scoreTest)
            link = "http://www.121kdp.ru/jsppages/skrining-serdechno-sosudistogo-riska.html"
        case "Хроническая болезнь легких (кашель, одышка)":
            resultLabel.text = resultHobl(for: scoreTest)
            link = "https://minzdrav.gov-murman.ru/documents/poryadki-okazaniya-meditsinskoy-pomoshchi/COPD2014may2.pdf"
        case "Риск сахарного диабета":
            resultLabel.text = resultDiabet(for: scoreTest)
            link = "http://www.121kdp.ru/jsppages/test-na-saharnyi-diabet.html"
        default:
            resultLabel.text = "Error"
        }
        
    }
    
    @IBAction func goToRootVC(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func linkOpen(_ sender: UIButton) {
        if let url = URL(string: link) {
          UIApplication.shared.open(url)
        } else {
          print("Неправильная ссылка")
        }
    }
    
}
