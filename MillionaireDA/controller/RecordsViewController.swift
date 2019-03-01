//
//  ViewController.swift
//  MillionaireDA
//
//  Created by Denis Evdokimov on 01/03/2019.
//  Copyright © 2019 Denis Evdokimov. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController {
    
    @IBOutlet weak var recordtableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordtableView.dataSource = self
        
    }
    
    
}


extension RecordsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        let record = Game.shared.records[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.textLabel?.text = dateFormatter.string(from: record.date)
        cell.detailTextLabel?.text = "Отвечено на \(record.score)% вопросов"
        return cell
    }
}

