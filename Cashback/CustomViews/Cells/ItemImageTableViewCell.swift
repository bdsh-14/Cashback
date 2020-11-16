//
//  ProductTableViewCell.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class ItemImageTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "offer_detail_cell"

    var productImageView = ProductImageView(frame: .zero)
    
    var padding: CGFloat = 8
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImageView)
        configure()
    }
    
    func set(offer: Offer) {
        NetworkManager.shared.downloadImage(from: offer.imageUrl ?? "") { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.productImageView.image = image
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            productImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}
