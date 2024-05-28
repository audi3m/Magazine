//
//  MagazineTableViewController.swift
//  Magazine
//
//  Created by J Oh on 5/25/24.
//

import UIKit

class MagazineTableViewController: UITableViewController {
    
    let list: [Magazine] = MagazineInfo.magazine
    
    var filteredList: [Magazine] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        filteredList = list
        navigationItem.title = "SeSAC TRAVEL"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.identifier, for: indexPath) as! MagazineTableViewCell
        let magazine = filteredList[indexPath.row]
        cell.configureData(data: magazine)
        return cell
    }
    
}
