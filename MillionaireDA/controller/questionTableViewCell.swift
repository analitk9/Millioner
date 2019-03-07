//
//  questionTableViewCell.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 05/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import UIKit

class questionTableViewCell: UITableViewCell {

   
   
    @IBOutlet weak var questionText: UITextField!
    
    @IBOutlet weak var answer0: UITextField!
    
    @IBOutlet weak var answer1: UITextField!
    
    @IBOutlet weak var answer2: UITextField!
    
    @IBOutlet weak var answer3: UITextField!
    
    @IBOutlet weak var currectAnswerNum: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
