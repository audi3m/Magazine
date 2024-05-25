//
//  MagazineTableViewController.swift
//  Magazine
//
//  Created by J Oh on 5/25/24.
//

import UIKit

class MagazineTableViewController: UITableViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SeSAC TRAVEL"
        tableView.rowHeight = 470
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MagazineInfo().magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell", for: indexPath) as! MagazineTableViewCell
        let magazine = MagazineInfo().magazine[indexPath.row]
        
        cell.magazineImageView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        cell.magazineImageView.layer.cornerRadius = 15
        cell.magazineImageView.contentMode = .scaleAspectFill
        
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.text = magazine.title
        cell.titleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        
        cell.subtitleLabel.text = magazine.subtitle
        cell.subtitleLabel.textColor = .gray
        
        cell.dateLabel.textAlignment = .right
        cell.dateLabel.text = customDateFormat(inputDate: magazine.date)
        cell.dateLabel.font = .systemFont(ofSize: 14)
        cell.dateLabel.textColor = .gray
        
        
        return cell
    }
    
    
    
    func customDateFormat(inputDate: String) -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyMMdd"
        
        let date = inputDateFormatter.date(from: inputDate) ?? .now
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "yy년 MM월 dd일"
        
        return outputDateFormatter.string(from: date)
    }

}
