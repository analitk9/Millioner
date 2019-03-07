//
//  Builder.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 06/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import Foundation

final class QuestionBilder {
    private(set) var question: String = ""
    private(set) var answer0: String = ""
    private(set) var answer1: String = ""
    private(set) var answer2: String = ""
    private(set) var answer3: String = ""
    private(set) var correctAnswer: Int = 0
    private(set) var questionArr: [Question] = []
    
    func setTextQuestion(_ text: String, at index:Int){
        self.questionArr[index].question = text
      
    }
    
    func setAnswer0(_ text: String, at index:Int){
       self.questionArr[index].answerArry[0] = text
    }
    
    func setAnswer1(_ text: String, at index:Int){
        self.questionArr[index].answerArry[1] = text
    }
    
    func setAnswer2(_ text: String, at index:Int){
        self.questionArr[index].answerArry[2] = text
    }
    
    func setAnswer3(_ text: String, at index:Int){
       self.questionArr[index].answerArry[3] = text
    }
    func setNumberCurrentQuestuin(_ num: Int, at index:Int){
        self.questionArr[index].currectAnswer = num
    }
    func buildEmptyQuestion(){
        questionArr.append(Question.init(question: self.question,
                             answerArry: [self.answer0,
                                          self.answer1,
                                          self.answer2,
                                          self.answer3], currectAnswer: correctAnswer))
        }
   
    
    func build()->[Question]{
       return questionArr
    }
    
}
