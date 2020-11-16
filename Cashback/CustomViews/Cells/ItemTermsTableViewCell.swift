//
//  ItemTermsTableViewCell.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class ItemTermsTableViewCell: UITableViewCell {

    static let reuseIdentifier = "terms_cell"
    
    let detailsLabel = CustomLabel()
    let termsLabel = CustomLabel()
    
    var padding: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(detailsLabel)
        contentView.addSubview(termsLabel)
        configure()
    }
    
    func set(offer: Offer) {
        detailsLabel.text = "Details"
        termsLabel.text = offer.terms
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        detailsLabel.configureLabel(fontName: "AvenirNext-DemiBold", size: 18, fontColor: UIColor(netHex: 0x4A4A4A))
        termsLabel.configureLabel(fontName: "AvenirNext-Regular", size: 15, fontColor: UIColor(netHex: 0x4A4A4A))
        termsLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            detailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            detailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            termsLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 8),
            termsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            termsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            termsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }

}
