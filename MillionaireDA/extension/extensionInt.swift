//
//  extensionInt.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 04/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import Foundation

extension Int {
    func randomFor(type: typeOfHelp)->[Int]{
        var result: [Int] = []
        var arr = [0,1,2,3]
        
        if let currentQ = Game.shared.gameSession?.currentQuestion.value,
            let currentAnswer = Game.shared.gameSession?.questionArr[currentQ].currectAnswer{
            
            switch type {
            case .auditorium:
                var tempArr = [0,0,0,0]
                for _ in  (0...1000) {
                    tempArr[Int.random(in: 0...3)] += 1
                    result = returnRatio(arr: tempArr, count: 1000)
                }
            case .call:
                result.append(Int.random(in: 0...3))
            case .half:
                arr.remove(at: currentAnswer)
                var randomindex = Int.random(in: 0...2)
                result.append(arr[randomindex])
                arr.remove(at: randomindex)
                randomindex = Int.random(in: 0...1)
                result.append(arr[randomindex])
                
            }
        }
        return result
    }
    func returnRatio(arr:[Int], count: Int)->[Int]{
        var result:[Int] = []
        for index in arr {
            let ratio = index * 100 / count
            result.append(ratio)
        }
        return result
        
    }
}
