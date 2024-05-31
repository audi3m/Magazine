//
//  RestaurantTableViewController.swift
//  Magazine
//
//  Created by J Oh on 5/25/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    
    let list = RestaurantList.restaurantArray
    var filteredList: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Restaurant"
        searchBar.delegate = self
        searchBar.placeholder = "검색"
        filteredList = list
        
        let all = UIBarButtonItem(title: "전체", style: .plain, target: self, action: #selector(allBarButtonClicked))
        navigationItem.leftBarButtonItem = all
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.id, for: indexPath) as! RestaurantTableViewCell
        let restaurant = filteredList[indexPath.row]
        
        cell.configureData(data: restaurant)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        return cell
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        let tag = sender.tag
        filteredList[tag].like.toggle()
        tableView.reloadRows(at: [IndexPath.SubSequence(row: sender.tag, section: 0)], with: .automatic)
        
    }
    
    @objc func allBarButtonClicked() {
        filteredList = list
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var searchList: [Restaurant] = []
        for item in list {
            if item.name.contains(searchBar.text!) || item.category.contains(searchBar.text!) {
                searchList.append(item)
            }
        }
        filteredList = searchList
        view.endEditing(true)
        tableView.reloadData()
    }
     
}
