//
//  AboutAppViewController.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 24.12.2020.
//

import UIKit

class AboutAppViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.dynamicColor
        textLabel.text = """
Приложение носит информационный характер. И не является медицинским средством. \n\nТесты помогают провести первичную самодиагностику, с целью обратить внимание пользователя на свое здоровье. \n\nЕсли у вас имеются жалобы на здоровье, обязательно обратитесь к врачу! \n
Приложение полностью конфиденциально и работает только внутри вашего устройства, без использования сети интернет. Мы не передаем и не получаем данные от вас. \n
Спасибо, что воспользовались нашим приложением. Будьте здоровы!
"""
    }
    
    @IBAction func back(unwindSegue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

}
