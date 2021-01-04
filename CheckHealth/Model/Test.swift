//
//  Test.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 08.12.2020.
//

import Foundation
import RealmSwift

class Test: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var group: String = ""
    @objc dynamic var countQuestions: Int = 0
    @objc dynamic var differentCountOfQuestions: Bool = false
    
    var answers = List<Answer>()
    var questions = List<Question>()
    
    
}

class Answer: Object {
    @objc dynamic var answer: String = ""
    @objc dynamic var countQuestionsOnAnswer: Int = 0
}

class Question: Object {
    @objc dynamic var question: String = ""
    @objc dynamic var score: Int = 0
}

