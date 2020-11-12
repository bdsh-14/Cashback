//
//  OfferDetailViewController.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class OfferDetailViewController: UIViewController {
    
    var detailTableView: UITableView!
    
    var offerDetail: Offer!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = offerDetail.name
        setupTableView()
    }
    
    func setupTableView() {
        detailTableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(detailTableView)
        navigationController?.navigationBar.prefersLargeTitles = false
        detailTableView.tableFooterView = UIView()
        detailTableView.estimatedRowHeight = 120
        detailTableView.separatorStyle = .none
        detailTableView.allowsSelection = false
        detailTableView.dataSource = self
        detailTableView.rowHeight = UITableView.automaticDimension
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.register(ItemImageTableViewCell.self, forCellReuseIdentifier: ItemImageTableViewCell.reuseIdentifier)
        detailTableView.register(ItemCashbackTableViewCell.self, forCellReuseIdentifier: ItemCashbackTableViewCell.reuseIdentifier)
        detailTableView.register(ItemTermsTableViewCell.self, forCellReuseIdentifier: ItemTermsTableViewCell.reuseIdentifier)

    }
}

extension OfferDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
           let cell = tableView.dequeueReusableCell(withIdentifier: ItemImageTableViewCell.reuseIdentifier, for: indexPath) as! ItemImageTableViewCell
            cell.set(offer: offerDetail)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemCashbackTableViewCell.reuseIdentifier, for: indexPath) as! ItemCashbackTableViewCell
             cell.set(offer: offerDetail)
             return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTermsTableViewCell.reuseIdentifier, for: indexPath) as! ItemTermsTableViewCell
             cell.set(offer: offerDetail)
             return cell
        default:
            return UITableViewCell()
        }
    }
}
