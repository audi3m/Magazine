//
//  MagazineTableViewCell.swift
//  Magazine
//
//  Created by J Oh on 5/25/24.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {
    
    static let identifier = "magazineCell"
    
    @IBOutlet var magazineImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func configureCell() {
        magazineImageView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        magazineImageView.layer.cornerRadius = 15
        magazineImageView.contentMode = .scaleAspectFill

        titleLabel.setting(size: 25, weight: .semibold, numberOfLines: 0)
        subtitleLabel.setting(color: .gray)
        dateLabel.setting(size: 14, color: .gray, align: .right)
    }
    
    func configureData(data: Magazine) {
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        dateLabel.text = data.dateFormatted
    }
    
}
