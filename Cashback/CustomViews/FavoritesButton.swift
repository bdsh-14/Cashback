//
//  FavoritesLabel.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class FavoritesButton: UIButton {
        
    var placeholderImage = UIImage(systemName: "checkmark.circle",
                                   withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium))?.withTintColor(.systemGreen)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = true
        setImage(placeholderImage, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
       
    }
}
