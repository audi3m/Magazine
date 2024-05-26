//
//  RestaurantTableViewCell.swift
//  Magazine
//
//  Created by J Oh on 5/25/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet var restaurantImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var categoryLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    

}



//struct Restaurant {
//    let image: String
//    let latitude: Double
//    let longitude: Double
//    let name: String
//    let address: String
//    let phoneNumber: String
//    let category: String
//    let price: Int
//    let type: Int
//}
