//
//  OffersTbCell.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/10/20.
//

import UIKit

class OffersTbCell: UITableViewCell {
    
    static let reuseIdentifier = "cell"
    var productImage = UIImageView()
    var cashbackAmount = UILabel()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(cashbackAmount)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        productImage.translatesAutoresizingMaskIntoConstraints = false
        cashbackAmount.translatesAutoresizingMaskIntoConstraints = false
        
        //constraints
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            productImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            productImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            productImage.heightAnchor.constraint(equalToConstant: 140),
            
            cashbackAmount.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            cashbackAmount.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            cashbackAmount.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }

}
