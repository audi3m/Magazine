//
//  RestaurantTableViewController.swift
//  Magazine
//
//  Created by J Oh on 5/25/24.
//

//struct Restaurant {
//    let image: String   -----
//    let latitude: Double
//    let longitude: Double
//    let name: String   -----
//    let address: String   -----
//    let phoneNumber: String   -----
//    let category: String   -----
//    let price: Int
//    let type: Int
//}

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var list = RestaurantList().restaurantArray
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Restaurant"
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantTableViewCell
        let restaurant = list[indexPath.row]
        
        let url = URL(string: restaurant.image)
        cell.restaurantImageView.load(url: url!)
        cell.restaurantImageView.backgroundColor = .systemGray6
        cell.restaurantImageView.contentMode = .scaleAspectFill
        cell.restaurantImageView.layer.cornerRadius = 10
        
        cell.nameLabel.text = restaurant.name
        cell.nameLabel.font = .boldSystemFont(ofSize: 18)
        
        
        cell.categoryLabel.text = " " + restaurant.category + " "
        cell.categoryLabel.font = .systemFont(ofSize: 13)
        cell.categoryLabel.layer.cornerRadius = 3
        cell.categoryLabel.layer.borderWidth = 1
        
        let image = UIImage(systemName: restaurant.like ? "heart.fill" : "heart")
        cell.likeButton.tag = indexPath.row
        cell.likeButton.setImage(image, for: .normal)
        cell.likeButton.tintColor = .systemPink
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        
        cell.addressLabel.text = restaurant.address
        cell.addressLabel.font = .systemFont(ofSize: 13)
        cell.addressLabel.textColor = .darkGray
        
        
        cell.phoneNumberLabel.text = restaurant.phoneNumber
        cell.phoneNumberLabel.font = .systemFont(ofSize: 13)
        cell.phoneNumberLabel.textColor = .darkGray
        
        
        cell.priceLabel.text = "￦ \(restaurant.price.formatted())"
        cell.priceLabel.font = .boldSystemFont(ofSize: 15)
        
        
        return cell
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        let tag = sender.tag
        list[tag].like.toggle()
        tableView.reloadRows(at: [IndexPath.SubSequence(row: sender.tag, section: 0)], with: .automatic)
        
    }
    
    

}
