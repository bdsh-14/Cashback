//
//  OffersCollectionViewCell.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "offersCell"
    
    let productImageView = ProductImageView(frame: .zero)
    let cashbackAmountLabel = TitleLabel(textAlignment: .left)
    let nameLabel = TitleLabel(textAlignment: .center)
    
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(offer: Offer) {
        cashbackAmountLabel.text = offer.current_value
        nameLabel.text = offer.name
    }
    
    private func configure() {
        addSubview(productImageView)
        addSubview(cashbackAmountLabel)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            productImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            
            cashbackAmountLabel.leftAnchor.constraint(equalTo: productImageView.leftAnchor, constant: 0),
            cashbackAmountLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -5),
            cashbackAmountLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: padding),
            cashbackAmountLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
            
            nameLabel.topAnchor.constraint(equalTo: cashbackAmountLabel.bottomAnchor, constant: 3),
            nameLabel.leftAnchor.constraint(equalTo: cashbackAmountLabel.leftAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
}
