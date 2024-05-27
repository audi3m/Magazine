//
//  RestaurantTableViewCell.swift
//  Magazine
//
//  Created by J Oh on 5/25/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet var restaurantImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var categoryLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() { 
        self.restaurantImageView.backgroundColor = .systemGray6
        self.restaurantImageView.contentMode = .scaleAspectFill
        self.restaurantImageView.layer.cornerRadius = 10
        
        self.nameLabel.font = .boldSystemFont(ofSize: 18)
        
        self.categoryLabel.font = .systemFont(ofSize: 13)
        self.categoryLabel.layer.cornerRadius = 3
        self.categoryLabel.layer.borderWidth = 1
        
        self.likeButton.tintColor = .systemPink
        
        self.addressLabel.font = .systemFont(ofSize: 13)
        self.addressLabel.textColor = .darkGray
        
        self.phoneNumberLabel.font = .systemFont(ofSize: 13)
        self.phoneNumberLabel.textColor = .darkGray
        
        self.priceLabel.font = .boldSystemFont(ofSize: 15)
         
    }
    
    func configureData(data: Restaurant) {
        
        let url = URL(string: data.image)
        restaurantImageView.kf.setImage(with: url)
        
        nameLabel.text = data.name
        categoryLabel.text = " " + data.category + " "
         
        addressLabel.text = data.address
        phoneNumberLabel.text = data.phoneNumber
        priceLabel.text = "￦ \(data.price.formatted())"
         
        let image = UIImage(systemName: data.like ? "heart.fill" : "heart")
        likeButton.setImage(image, for: .normal)
        likeButton.tintColor = .systemPink
        
    }
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
