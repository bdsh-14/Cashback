//
//  ItemCashbackTableViewCell.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class ItemCashbackTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "item_cash_back"
    
    var cashbackLabel = CustomLabel()
    var descLabel = CustomLabel()
    var favoriteButton = FavoritesButton(frame: .zero)
    var isFavorite: Bool = false
    var padding: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cashbackLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(favoriteButton)
        configure()
    }
    
    func set(offer: Offer) {
        cashbackLabel.text = offer.currentValue
        descLabel.text = offer.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        cashbackLabel.configureLabel(fontName: "AvenirNext-DemiBold", size: 18, fontColor: UIColor(netHex: 0x4A4A4A))
        descLabel.configureLabel(fontName: "AvenirNext-Regular", size: 15, fontColor: UIColor(netHex: 0x4A4A4A))
        NSLayoutConstraint.activate([
            cashbackLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cashbackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cashbackLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -padding),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            favoriteButton.bottomAnchor.constraint(equalTo: descLabel.topAnchor, constant: 4),
            
            descLabel.topAnchor.constraint(equalTo: cashbackLabel.bottomAnchor, constant: 4),
            descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)

        ])
    }
}
