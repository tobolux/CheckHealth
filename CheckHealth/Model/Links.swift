//
//  Links.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 22.01.2021.
//

import Foundation

func resultLink(name: String) -> String {
    switch name {
    case "Индекс женской сексуальной функции ":
        return "https://dr-arabin.ru/pacientam/opredelenie-indeksa-zhenskoj-seksualnosti-fsfi.html"
    case "Опущение органов таза у женщин":
        return "https://dr-arabin.ru/pacientam/test-rannej-diagnostiki-prolapsa-organov-malogo-taza.html "
    case "Старение у женщин (период климакса)":
        return "https://mama-clinic.ru/otsenite-est-li-u-vas-klimaks"
    case "Предстательная железа (проблемы мочеиспускания у мужчин)":
        return "https://angiohelp.ru/embolizatsiya/oprosnik-ipss.html"
    case "Старение у мужчин (снижение тестостерона)":
        return "https://genesis-clinic.ru/uslugi/andrologiya/ams-oprosnik-vozrastnykh-simptomov-muzhchiny/"
    case "Эректильная функция (эрекция)":
        return "https://klinikaluc.lv/mief5.html"
    case "Риск развития онкологических заболеваний (общий)":
        return "http://slobodskoy.medkirov.ru/site/LSPEF0804/$file/%D0%B3%D0%B0%D0%B7%D0%B5%D1%82%D0%B0%204.compressed.pdf"
    case let str where str.contains("Риск рака"):
        return "https://www.rkdc.ru/meditsinskaya-profilaktika-statii/profilaktika_drugih_infesiy/anketa-po-ocenke-riska-razvitiya-zlokachestvennyh-novoobrazovaniy-po-organam-i-sistemam/"
    case "Алкогольная зависимость":
        return "http://www.medpsy.ru/dictionary/metod_12_005.php"
    case "Никотиновая зависимость":
        return "https://mosgorzdrav.ru/ru-RU/test/default/card/1.html"
    case "Бессоница":
        return "https://memini.ru/tests/24873"
    case "Депрессия":
        return "http://clinica.nsk.ru/info/testy/testy-na-stressy-depressiyu-trevozhnost/shkala-depressii-beka-test-oprosnik/"
    case "Память":
        return "https://rgnkc.ru/proverka-pamiati"
    case "Варикозное расширение вен":
        return "https://www.phleboscience.ru/background/Poleznie-stati/naskolko-vysoka-vasha-predraspolojennost-k-varikozu/"
    case "Вероятность инсульта":
        return "http://www.121kdp.ru/jsppages/narushenie-mozgovogo-krovoobrasheniya-anketa-celt-.html"
    case "Риск сердечно-сосудистых заболеваний":
        return "http://www.121kdp.ru/jsppages/skrining-serdechno-sosudistogo-riska.html"
    case "Хроническая болезнь легких (кашель, одышка)":
        return "https://minzdrav.gov-murman.ru/documents/poryadki-okazaniya-meditsinskoy-pomoshchi/COPD2014may2.pdf"
    case "Риск сахарного диабета":
        return "http://www.121kdp.ru/jsppages/test-na-saharnyi-diabet.html"
    default:
        return "Error"
    }
}


