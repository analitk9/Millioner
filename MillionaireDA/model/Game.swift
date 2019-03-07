//
//  Game.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 01/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import Foundation

struct Record: Codable {
    let date: Date
    let score: Int
}


final class Game {
    
    static let shared = Game()
    var gameSession: GameSession?
    private let recordsCaretaker = RecordsCaretaker()
    private let questionsCaretaker = QuestionCaretaker()
    
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    
    private (set) var customQuestions: [Question] {
        didSet {
            questionsCaretaker.save(questions: self.customQuestions)
        }
    }
    
    var isRandomQuestion: Bool = false
    var sourceOfQuestion: Int = 0
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.customQuestions = self.questionsCaretaker.retrieveQuestions()
    }
    
    func addRecord(_ record: Record){
        
        self.records.append(record)
    }
    
    func addCustomQuestion(_ question: Question) {
        self.customQuestions.append(question)
    }
    
    func clearRecords() {
        self.records = []
    }
    
    
}
