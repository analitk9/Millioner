//
//  GameSession.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 01/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import Foundation

final class GameSession {
    var totalCorrectAnswer: Int = 0
    var currentQuestion:Int = 0
    var questionArr: [Question]
    var helps: QuestionHelps
    
    init(_ arr: [Question]) {
        self.questionArr = arr
        self.helps = QuestionHelps()
    }
    
    
}
