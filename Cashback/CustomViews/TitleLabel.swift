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
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    private func configure() {
        textColor = .black
        font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        adjustsFontSizeToFitWidth = true
        
        // TODO: fix color
        textColor = .systemGray2
        minimumScaleFactor = 0.75
        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byWordWrapping
        
        // TODO: compression hugging to display the dots
        
    }
}
