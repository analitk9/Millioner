//
//  GameViewController.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 01/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import UIKit
import Foundation

enum stateButton: String{
    case on = "On"
    case off = "Off"
    case selected = "Selected"
}

enum typeOfHelp {
    case call
    case half
    case auditorium
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer0Button: UIButton!
    
    @IBOutlet weak var answer1Button: UIButton!
    
    @IBOutlet weak var answer2Button: UIButton!
    
    @IBOutlet weak var answer3Button: UIButton!
    
    
    @IBOutlet weak var halfButton: UIButton!
    
    @IBOutlet weak var auditoriumButton: UIButton!
    
    @IBOutlet weak var callButton: UIButton!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    var onEndGame: ((Int)-> Void)?
  lazy var heldsFacade: HelpsFacade = {
        return HelpsFacade.init(gameSession: Game.shared.gameSession!)
    }()
    var totatInfoStateGame: String = "" {
        didSet {
           infoLabel.text = totatInfoStateGame
        }
        
    }
    var infoCurrentQ: Int = 0 {
        didSet {
            totatInfoStateGame = "\(infoCurrentQ+1) вопрос. Отвечено на \(countScore())%"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGame()
        showQuestion()
        Game.shared.gameSession?.currentQuestion.addObserver(self, removeIfExists: true, options: [.new, .initial], closure: { [weak self] (currentQuestion, _) in
                self?.infoCurrentQ = currentQuestion

        })
    }
    
    
    @IBAction func choiceAnswer(_ sender: UIButton) {
        guard let  gameSession = Game.shared.gameSession else {return}
        
        let actualQ = gameSession.currentQuestion.value
        
        if sender.tag != gameSession.questionArr[actualQ].currectAnswer {
            didEndGame()
        }else {
            gameSession.totalCorrectAnswer.value += 1
            gameSession.currentQuestion.value += 1
            showQuestion()
        }
    }
    
    @IBAction func pressed50(_ sender: UIButton) {
        guard let image = UIImage(named: "50Selected") else {return}
        sender.setImage(image, for: .normal)
        Game.shared.gameSession?.helps.halfWrong = false
        sender.isEnabled = false
        
        let visibleAnswer = heldsFacade.use50to50Hint()
        for index in visibleAnswer{
            switch index {
            case 0:
                answer0Button.alpha = 0.0
            case 1:
                answer1Button.alpha = 0.0
            case 2:
                answer2Button.alpha = 0.0
            case 3:
                answer3Button.alpha = 0.0
            default:
                print("странное число \(index)")
            }
        }
    }
    
    @IBAction func pressedAuditorium(_ sender: UIButton) {
        guard let image = UIImage(named: "auditoriumSelected") else {return}
        sender.setImage(image, for: .normal)
        sender.isEnabled = false
        Game.shared.gameSession?.helps.auditorium = false
        
        self.present(heldsFacade.useAuditoryHelp(), animated: true, completion: nil)
    }
    
    @IBAction func pressedCall(_ sender: UIButton) {
        guard let image = UIImage(named: "callSelected") else {return}
        sender.setImage(image, for: .normal)
        sender.isEnabled = false
        Game.shared.gameSession?.helps.callFriend = false
 
        self.present(heldsFacade.callFriend(), animated: true, completion: nil)
    }
 
    func createGame(){
        
        Game.shared.gameSession = GameSession(bdCreator().createQuestions())        
        updateUI(gameSession: Game.shared.gameSession!)
    }
    
    func updateUI(gameSession: GameSession){
        let stateHalf = gameSession.helps.halfWrong
        let stateCall = gameSession.helps.callFriend
        let stateAuditorium = gameSession.helps.auditorium
        if let halfImage = selectImagefor(button: .half, for: stateHalf ? .on : .off ),
            let callImage = selectImagefor(button: .call, for: stateCall ? .on : .off ),
            let auditoriumImage = selectImagefor(button: .auditorium, for: stateAuditorium ? .on : .off ){
            
            halfButton.setImage(halfImage, for: .normal)
            auditoriumButton.setImage(auditoriumImage, for: .normal)
            callButton.setImage(callImage, for: .normal)
        }
        
        answer0Button.alpha = 1.0
        answer1Button.alpha = 1.0
        answer2Button.alpha = 1.0
        answer3Button.alpha = 1.0
    }
    
    func selectImagefor(button: typeOfHelp, for state: stateButton)->UIImage?{
        var resultImage: UIImage?
        switch button {
        case .half:
            resultImage = UIImage(named: "50\(state.rawValue)")
        case .auditorium:
             resultImage = UIImage(named: "auditorium\(state.rawValue)")
        case .call:
        resultImage = UIImage(named: "call\(state.rawValue)")
            
        }
        return resultImage
    }
    
    func showQuestion(){
        guard let  gameSession = Game.shared.gameSession else {return}
        let actualQ = gameSession.currentQuestion.value
        if gameSession.questionArr.count != actualQ {
            questionLabel.text = gameSession.questionArr[actualQ].question
            answer0Button.setTitle("\(gameSession.questionArr[actualQ].answerArry[answer0Button.tag])", for: .normal)
            answer1Button.setTitle("\(gameSession.questionArr[actualQ].answerArry[answer1Button.tag])", for: .normal)
            answer2Button.setTitle("\(gameSession.questionArr[actualQ].answerArry[answer2Button.tag])", for: .normal)
            answer3Button.setTitle("\(gameSession.questionArr[actualQ].answerArry[answer3Button.tag])", for: .normal)
            updateUI(gameSession: gameSession)
        } else {
            didEndGame()
        }
    }
    
    func didEndGame(){

        let record = Record(date: Date(), score: countScore())
        Game.shared.addRecord(record)
        
        Game.shared.gameSession = nil
         dismiss(animated: true, completion: nil)
    }
    
    func countScore()->Int{
        guard let  gameSession = Game.shared.gameSession else {return 0}
        let  actualQ = gameSession.currentQuestion.value
        let totalQ = gameSession.questionArr.count
        
        return Int((Float(actualQ) / Float(totalQ)) * 100.00)
    }
    
}
