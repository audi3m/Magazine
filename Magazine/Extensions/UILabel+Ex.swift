//
//  UILabel+Ex.swift
//  Magazine
//
//  Created by J Oh on 5/28/24.
//

import UIKit

extension UILabel {
    func setting(size: CGFloat = 17, weight: UIFont.Weight = .regular, color: UIColor = .label, 
                 cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, numberOfLines: Int = 1, align: NSTextAlignment = .left) {
        self.font = .systemFont(ofSize: size, weight: weight)
        self.textColor = color
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.numberOfLines = numberOfLines
        self.textAlignment = align
    }
}




//titleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
