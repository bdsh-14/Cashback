//
//  ImageView.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class ProductImageView: UIImageView {
    let placeHolderImage = UIImage(named: "Placeholder_image")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 5
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
