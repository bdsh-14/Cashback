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
    let isFavoritedImage = ProductImageView(frame: .zero)
    
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
        productImageView.addSubview(isFavoritedImage)
        isFavoritedImage.isOpaque = true
        
     //   isFavoritedImage.isHidden = true
        isFavoritedImage.image = UIImage(systemName: "checkmark.circle.fill",
                                         withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium))?.withTintColor(.systemGreen)
        
        cashbackAmountLabel.configureLabel(fontName: "AvenirNext-DemiBold", size: 12, fontColor: .black)
        nameLabel.configureLabel(fontName: "AvenirNext-Regular", size: 12, fontColor: .gray)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 180),
            
            cashbackAmountLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            cashbackAmountLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            cashbackAmountLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -8),
            cashbackAmountLabel.heightAnchor.constraint(equalToConstant: 15),
            
            nameLabel.topAnchor.constraint(equalTo: cashbackAmountLabel.bottomAnchor, constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: cashbackAmountLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            
            isFavoritedImage.topAnchor.constraint(equalTo: productImageView.topAnchor),
            isFavoritedImage.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor)
            
        ])
    }
}
