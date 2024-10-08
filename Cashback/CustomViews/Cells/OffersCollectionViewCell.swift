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
        NetworkManager.shared.downloadImage(from: offer.imageUrl ?? "") { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.productImageView.image = image
            }
        }
    }
    
    private func configure() {
        addSubview(productImageView)
        addSubview(cashbackAmountLabel)
        addSubview(nameLabel)
        productImageView.image?.withAlignmentRectInsets(UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
       
        // this image is added if an item has been selected as a favorite
        productImageView.addSubview(isFavoritedImage)
        isFavoritedImage.isOpaque = true
        isFavoritedImage.isHidden = true
        isFavoritedImage.image = UIImage(systemName: "checkmark.circle.fill",
                                         withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium))?.withTintColor(.systemGreen)
        
        cashbackAmountLabel.configureLabel(fontName: "AvenirNext-DemiBold", size: 12, fontColor: UIColor(netHex: 0x4A4A4A))
        nameLabel.configureLabel(fontName: "AvenirNext-Regular", size: 11, fontColor: UIColor(netHex: 0x4A4A4A))
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 200),
            
            cashbackAmountLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            cashbackAmountLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            cashbackAmountLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -8),
            cashbackAmountLabel.heightAnchor.constraint(equalToConstant: 15),
            
            nameLabel.topAnchor.constraint(equalTo: cashbackAmountLabel.bottomAnchor, constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: cashbackAmountLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            
            isFavoritedImage.topAnchor.constraint(equalTo: productImageView.topAnchor),
            isFavoritedImage.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor)
        ])
    }
}
