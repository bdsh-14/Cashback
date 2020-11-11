//
//  ViewController.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/10/20.
//

import UIKit

class OffersListViewController: UIViewController {
    
    var offersTableView = UITableView()
    
    let offers = Offer.offersFromJson()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offers"
       // view.backgroundColor = .systemPin
        setupTableView()
        
    }
    
    func setupTableView() {
        view.addSubview(offersTableView)
        offersTableView.translatesAutoresizingMaskIntoConstraints = false
        offersTableView.dataSource = self
        NSLayoutConstraint.activate([
            offersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            offersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            offersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            offersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        offersTableView.register(OffersTbCell.self, forCellReuseIdentifier: OffersTbCell.reuseIdentifier)
    }
}

extension OffersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(offers.count)
        return offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OffersTbCell.reuseIdentifier, for: indexPath) as! OffersTbCell
        let offer = offers[indexPath.row]
        cell.cashbackAmount.text = offer.current_value
        return cell
    
    }
    
    
}

