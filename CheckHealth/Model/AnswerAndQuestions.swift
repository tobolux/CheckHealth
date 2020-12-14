//
//  Quest.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 10.12.2020.
//

import Foundation
import RealmSwift



class Answer: Object {
    
    @objc dynamic var answer: String = ""

    //let questions = List<Questions>()

}

class Question: Object {
    @objc dynamic var question: String = ""
    @objc dynamic var score: Int = 0
    
}



    
    

