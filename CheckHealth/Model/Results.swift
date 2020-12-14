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
        return "легкая симптоматика"
    case 8...19:
        return "умеренная степень тяжести"
    case 20...:
        return "тяжелая степень нарушений"
    default:
        return "ошибка"
    }
}

func resultMIEF5(for value: Int) -> String {
    switch value {
    case 5...7:
        return "Все отлично. Проблем с эрекцией нет"
    case 8...11:
        return "Легкая степень нарушения эректильной функции"
    case 12...16:
        return "Умеренно-легкая степень нарушения эректильной функции"
    case 17...21:
        return "Умеренная степень нарушения эректильной функции"
    case 22...25:
        return "Тяжелая степень нарушения эректильной функции"
    default:
        return "ошибка"
    }
}
