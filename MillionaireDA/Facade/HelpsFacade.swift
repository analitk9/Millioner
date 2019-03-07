//
//  HelpsFacade.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 06/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import Foundation
import UIKit
final class HelpsFacade{
    let gameSession: GameSession
    
    init(gameSession: GameSession ) {
        self.gameSession = gameSession
    }
    
    func callFriend()-> UIAlertController{
        let callQuestion = Int().randomFor(type: .call)
        
        let actionSheet = UIAlertController(title: "Ответ воображаемого друга",
                                            message: "Я считаю что правильный ответ №\(callQuestion[0]+1)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
        actionSheet.addAction(cancelAction)
        return actionSheet
    }
   
    func useAuditoryHelp()-> UIAlertController{
        let auditoriumQuestion = Int().randomFor(type: .auditorium)
        let actionSheet = UIAlertController(title: "Мнение зала",
                                            message: "", preferredStyle: .alert)
        for index in 0...3 {
            actionSheet.addTextField { textField in
                textField.text = "\(auditoriumQuestion[index])% за \(index + 1) ответ"
            }
        }
        
        let cancelAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
        actionSheet.addAction(cancelAction)
        
        return actionSheet
        
    }
    
    func use50to50Hint()-> [Int]{
        return Int().randomFor(type: .half)
    }
}
