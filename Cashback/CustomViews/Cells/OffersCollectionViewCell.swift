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
    let cashbackAmountLabel = CustomLabel()
    let nameLabel = CustomLabel()
    let favoritesButton = FavoritesButton()
    
    let padding: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(offer: Offer) {
        cashbackAmountLabel.text = offer.currentValue
        nameLabel.text = offer.name
        productImageView.downloadImage(from: offer.imageUrl ?? "")
    }
    
    private func configure() {
        addSubview(productImageView)
        addSubview(cashbackAmountLabel)
        addSubview(nameLabel)
        addSubview(favoritesButton)
        cashbackAmountLabel.configureLabel(fontName: "AvenirNext-DemiBold", size: 12, fontColor: .black)
        nameLabel.configureLabel(fontName: "AvenirNext-Regular", size: 12, fontColor: .gray)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            productImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            
            cashbackAmountLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor, constant: 0),
            cashbackAmountLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -5),
            cashbackAmountLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            
            nameLabel.topAnchor.constraint(equalTo: cashbackAmountLabel.bottomAnchor, constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: cashbackAmountLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
}
