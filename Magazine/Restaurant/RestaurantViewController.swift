//
//  Restaurant2ViewController.swift
//  Magazine
//
//  Created by J Oh on 5/31/24.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    let list = RestaurantList.restaurantArray
    var filteredList: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Restaurant"
        configureSearchBar()
        configureTableView()
        filteredList = list
        
        let left = UIBarButtonItem(title: "전체", style: .plain, target: self, action: #selector(leftBarButtonClicked))
        let right = UIBarButtonItem(title: "지도", style: .plain, target: self, action: #selector(rightBarButtonClicked))
        navigationItem.leftBarButtonItem = left
        navigationItem.rightBarButtonItem = right
        
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        let tag = sender.tag
        filteredList[tag].like.toggle()
        tableView.reloadRows(at: [IndexPath.SubSequence(row: sender.tag, section: 0)], with: .automatic)
        
    }
    
    @objc func leftBarButtonClicked() {
        filteredList = list
        view.endEditing(true)
        tableView.reloadData()
    }
    
    @objc func rightBarButtonClicked() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: MapViewController.id) as! MapViewController
        navigationController?.pushViewController(vc, animated: true)
        // 3. 화면 띄우기
//        present(vc, animated: true)
            
        
    }
    
    
}

extension RestaurantViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: RestaurantTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: RestaurantTableViewCell.id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.id, for: indexPath) as! RestaurantTableViewCell
        let restaurant = filteredList[indexPath.row]
        
        cell.configureData(data: restaurant)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

extension RestaurantViewController: UISearchBarDelegate {
    
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "검색"
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
