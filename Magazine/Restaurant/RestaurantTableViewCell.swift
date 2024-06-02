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
        
        self.nameLabel.setting(size: 18, weight: .bold)
        self.categoryLabel.setting(size: 13, cornerRadius: 3, borderWidth: 1)
        self.addressLabel.setting(size: 13, color: .darkGray, numberOfLines: 0)
        self.phoneNumberLabel.setting(size: 13, color: .darkGray)
        self.priceLabel.setting(size: 15, weight: .bold)
        
        self.likeButton.tintColor = .systemPink
         
    }
    
    func configureData(data: Restaurant) {
        let url = URL(string: data.image)
        restaurantImageView.kf.setImage(with: url)
        
        nameLabel.text = data.name
        categoryLabel.text = data.categoryForLabel
        addressLabel.text = data.address
        phoneNumberLabel.text = data.phoneNumber
        priceLabel.text = data.priceLabel
         
        let image = UIImage(systemName: data.like ? "heart.fill" : "heart")
        likeButton.setImage(image, for: .normal)
        likeButton.tintColor = .systemPink
    }
}
