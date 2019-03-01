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
   
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
   
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }
    
    func addRecord(_ record: Record){
        
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
    
}
