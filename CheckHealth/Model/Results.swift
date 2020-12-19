//
//  Results.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 14.12.2020.
//

import Foundation


func resultIPSS(for value: Int) -> String {
    switch value {
    case 0...7:
        return "Легкая симптоматика"
    case 8...19:
        return "Умеренная степень тяжести"
    case 20...:
        return "Тяжелая степень нарушений"
    default:
        return "Ошибка"
    }
}

func resultMIEF5(for value: Int) -> String {
    switch value {
    case 5...7:
        return "Все отлично. Проблем с эрекцией нет \n"
    case 8...11:
        return "Легкая степень нарушения эректильной функции. \n\nВозможно, стоит обратиться к врачу урологу-андрологу \n"
    case 12...16:
        return "Умеренно-легкая степень нарушения эректильной функции. \n\nОбратитесь к врачу урологу-андрологу \n"
    case 17...21:
        return "Умеренная степень нарушения эректильной функции. \n\nОбратитесь к врачу урологу-андрологу \n"
    case 22...25:
        return "Тяжелая степень нарушения эректильной функции. \n\nОбратитесь к врачу урологу-андрологу \n"
    default:
        return "Ошибка"
    }
}

func resultCAGE(for value: Int) -> String {
    switch value {
    case 0:
        return "Алкогольной зависимости нет"
    case 1:
        return "Имеется риск возникновения алкогольной зависимости"
    case 2...3:
        return "Средняя вероятность наличия алкогольной зависимости"
    case 4:
        return "Высокая вероятность наличия алкогольной зависимости"
    default:
        return "Ошибка"
    }
}

