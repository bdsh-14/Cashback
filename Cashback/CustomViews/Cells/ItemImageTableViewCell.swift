//
//  ProductTableViewCell.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class ItemImageTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "offer_detail_cell"

    var productImage = ProductImageView(frame: .zero)
    
    var padding: CGFloat = 8
    
//    let markFavorite = UIImage(systemName: "checkmark.circle.fill")
//    let removeFavorite = UIImage(systemName: "checkmark.circle")
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        configure()
    }
    
    func set(offer: Offer) {
        productImage.downloadImage(from: offer.url ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            productImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            productImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}
