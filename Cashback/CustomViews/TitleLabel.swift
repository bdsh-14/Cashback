//
//  TitleLabel.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .black
        textAlignment = .left
        font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        adjustsFontSizeToFitWidth = true
        
        // TODO: fix color
        minimumScaleFactor = 0.75
        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byWordWrapping
        
        // TODO: compression hugging to display the dots
        
    }
}
