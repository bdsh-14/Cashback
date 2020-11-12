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
        cashbackLabel.text = offer.current_value
        descLabel.text = offer.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        cashbackLabel.configureLabel(fontName: "AvenirNext-DemiBold", size: 18, fontColor: .black)
        descLabel.configureLabel(fontName: "AvenirNext-Regular", size: 15, fontColor: .gray)
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
        
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "checkmark.circle",
                             withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium))?.withTintColor(.systemGreen), for: .normal)
        }
    }
    
    
}
