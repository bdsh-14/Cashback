//
//  ProductTableViewCell.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    

    var productImage = ProductImageView(frame: .zero)
    var productNameLabel = TitleLabel()
    
    var padding: CGFloat = 8
    
//    let markFavorite = UIImage(systemName: "checkmark.circle.fill")
//    let removeFavorite = UIImage(systemName: "checkmark.circle")
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(productNameLabel)
    }
    
    func set(offer: Offer) {
        productNameLabel.text = offer.name
        productImage.downloadImage(from: offer.url ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            productNameLabel.bottomAnchor.constraint(equalTo: productImage.topAnchor, constant: -padding),
            
            productImage.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: padding),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }

}
