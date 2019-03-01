//
//  bdCreator.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 01/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import Foundation

struct bdCreator {
    func createQuestions() -> [Question] {
        let q1 = Question.init(question: "Как правильно закончить пословицу: «Не откладывай на завтра то, что можно…»?",
                               answerArry: ["сделать сегодня",
                                            "сделать послезавтра",
                                            "сделать через месяц",
                                            "никогда не делать"], currectAnswer: 0)
        let q2 = Question.init(question: "Что говорит человек, когда замечает нечто необычное?",
                               answerArry: ["попало в лоб",
                                            "залетело в рот",
                                            "накапало в уши",
                                            "бросилось в глаза"], currectAnswer: 3)
        
        let q3 = Question.init(question: "Какой наряд прославил баснописец Крылов?",
                               answerArry: ["тришкин кафтан",
                                            "ивашкин армяк","прошкин зипун","машкин сарафан"], currectAnswer: 0)
        let q4 = Question.init(question: "В какой стране появилась мандолина?",
                               answerArry: ["Испания",
                                            "Италия",
                                            "Венгрия",
                                            "Греция"], currectAnswer: 1)
        let q5 = Question.init(question: "Где в Древней Греции можно было увидеть надпись: «Здесь живут мертвые и говорят немые»?",
                               answerArry: ["на кладбищах",
                                            "в больницах",
                                            "в библиотеках",
                                            "в тюрьмах"], currectAnswer: 3)
        let q6 = Question.init(question: "Что такое лобогрейка?",
                               answerArry: ["жнейка",
                                            "шапка",
                                            "болезнь",
                                            "печка",], currectAnswer: 0)
        let q7 = Question.init(question: "Что на Руси называли «голова садовая»?",
                               answerArry: ["репу",
                                            "свеклу",
                                            "капусту",
                                            "яблоко"], currectAnswer: 2)
        let q8 = Question.init(question: "Что можно сделать, используя крупчатку?",
                               answerArry: ["покрыть дорогу",
                                            "слепить снежок",
                                            "замесить тесто",
                                            "оседлать лошадь"], currectAnswer: 2)
        
        
      return [q1,q2,q3,q4,q5,q6,q7,q8]
    }
}
