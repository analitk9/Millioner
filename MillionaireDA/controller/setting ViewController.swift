//
//  setting ViewController.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 05/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import UIKit

class setting_ViewController: UIViewController {

    @IBOutlet weak var settingSegment: UISegmentedControl!
    
    @IBOutlet weak var sourceOfQuestionSegmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func shangedValue(_ sender: UISegmentedControl) {
        Game.shared.isRandomQuestion = sender.selectedSegmentIndex == 1
    }
    
   
    @IBAction func sourceChange(_ sender: UISegmentedControl) {
        Game.shared.sourceOfQuestion = sender.selectedSegmentIndex
    }
    
}
