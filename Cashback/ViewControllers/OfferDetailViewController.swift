//
//  OfferDetailViewController.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
//

import UIKit

class OfferDetailViewController: UIViewController {
    
    var detailTableView: UITableView!
    var indexPath: IndexPath?
    var offerDetail: Offer!
    var favoriteOffers: [Offer] = []
    
    let label: CustomLabel = {
        let lb = CustomLabel()
        lb.configureLabel(fontName: "AvenirNext-DemiBold", size: 15, fontColor: .black)
        lb.numberOfLines = 0
        lb.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        lb.textAlignment = .center
        return lb
    }()
    
    enum DetailRows: Int {
        case itemImage = 0
        case cashback
        case terms
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = label
        label.text = offerDetail.name
        setupTableView()
        getFavorites()
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let offer):
                self.favoriteOffers.append(contentsOf: offer)
    
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
    
    @objc func favoritesButtonTapped(sender: UIButton) {
        guard let indexpath = indexPath else { return }
        let cell = detailTableView.cellForRow(at: indexpath) as! ItemCashbackTableViewCell
        if cell.isFavorite {
            cell.isFavorite = false
            PersistenceManager.updateWith(favorite: offerDetail, actionType: .remove) { (error) in
                guard let _ = error else {
                    return
                }
            }
            let image = UIImage(systemName: "checkmark.circle",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium))?.withTintColor(.systemGreen)
            cell.favoriteButton.setImage(image, for: .normal)
        } else {
            cell.isFavorite = true
            PersistenceManager.updateWith(favorite: offerDetail, actionType: .add) { (error) in
                guard let _ = error else {
                    return
                }
            }
            let image = UIImage(systemName: "checkmark.circle.fill",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium))?.withTintColor(.systemGreen)
            cell.favoriteButton.setImage(image, for: .normal)
        }
    }
}

extension OfferDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailRows = DetailRows(rawValue: indexPath.row)
        switch detailRows {
        case .itemImage:
           let cell = tableView.dequeueReusableCell(withIdentifier: ItemImageTableViewCell.reuseIdentifier, for: indexPath) as! ItemImageTableViewCell
            cell.set(offer: offerDetail)
            return cell
            
        case .cashback:
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemCashbackTableViewCell.reuseIdentifier, for: indexPath) as! ItemCashbackTableViewCell
            cell.set(offer: offerDetail)
            if favoriteOffers.contains(offerDetail) {
                cell.favoriteButton.setImage(UIImage(systemName: "checkmark.circle.fill",
                                                     withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium))?.withTintColor(.systemGreen), for: .normal)
            }
            self.indexPath = indexPath
            cell.favoriteButton.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
             return cell
        case .terms:
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTermsTableViewCell.reuseIdentifier, for: indexPath) as! ItemTermsTableViewCell
             cell.set(offer: offerDetail)
             return cell
        default:
            return UITableViewCell()
        }
    }
}

