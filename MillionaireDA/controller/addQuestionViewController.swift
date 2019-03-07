//
//  addQuestionViewController.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 05/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import UIKit

class addQuestionViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var tableQuestion: UITableView!
   
    
    
    var questionBuilder = QuestionBilder()
    var currentIndexCell: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableQuestion.dataSource = self
      // newQuestionArr = bdCreator().createQuestions()
        
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        for question in questionBuilder.questionArr {
            Game.shared.addCustomQuestion(question)
        }
        
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
      
        questionBuilder.buildEmptyQuestion()
       
        tableQuestion.reloadData()
    }
    
    @IBAction func endEditing(_ sender: UITextField)
    {
       if let indexPath = tableQuestion.indexPathForSelectedRow, let text = sender.text {
            
            switch sender.tag {
            case 0:
               questionBuilder.setAnswer0(text, at:indexPath.row )
            case 1:
               questionBuilder.setAnswer1(text, at: indexPath.row )
            case 2:
                questionBuilder.setAnswer2(text, at: indexPath.row )
            case 3:
                questionBuilder.setAnswer3(text, at: indexPath.row )
            case 4:
                 questionBuilder.setTextQuestion(text, at: indexPath.row )
            case 5:
                questionBuilder.setNumberCurrentQuestuin(Int(text)!, at: indexPath.row )
            default:
                fatalError()
            }
            
        }
    }
}

// MARK: - <#UITableViewDataSource#>
extension addQuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionBuilder.questionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! questionTableViewCell
        let source = questionBuilder.questionArr
        cell.questionText.text = source[indexPath.row].question
        cell.currectAnswerNum.text = String(source[indexPath.row].currectAnswer)
        
        cell.answer0.text = source[indexPath.row].answerArry[0]
        cell.answer1.text = source[indexPath.row].answerArry[1]
        cell.answer2.text = source[indexPath.row].answerArry[2]
        cell.answer3.text = source[indexPath.row].answerArry[3]
        return cell
        
    }
    
}

// MARK: - <#UITableViewDelegate#>
extension addQuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //currentIndexCell = indexPath.row
    }
    
}
