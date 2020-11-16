//
//  OffersListViewController.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/15/20.
//

import UIKit

class OffersListViewController: UIViewController {
    
    var offersCollectionView: UICollectionView!
    let offers = NetworkManager.shared.offersFromJson()
    var searchedOffers: [Offer] = []
    var isSearching: Bool = false
    var favoriteOffers: [Offer] = []
    private let defaultDebounceDelay: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Offers"
        getFavorites()
        setupCollectionView()
        setupSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        getFavorites()
        offersCollectionView.reloadData()
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [self] (result) in
            switch result {
            case .success(let favorites):
                self.favoriteOffers = favorites
            case .failure(_):
                break
            }
        }
    }
    
    func setupCollectionView() {
        offersCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowLayout())
        view.addSubview(offersCollectionView)
        offersCollectionView.backgroundColor = .systemBackground
        offersCollectionView.delegate = self
        offersCollectionView.dataSource = self
        offersCollectionView.register(OffersCollectionViewCell.self, forCellWithReuseIdentifier: OffersCollectionViewCell.reuseIdentifier)
    }
    
    func createTwoColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumSpacing: CGFloat = 8
        let availableWidth = width - (padding * 2) - minimumSpacing
        let itemWidth = availableWidth/2
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: padding, bottom: 24, right: 8)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func setupSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search items"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
}

extension OffersListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearching ? searchedOffers.count : offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.reuseIdentifier, for: indexPath) as! OffersCollectionViewCell
        let selectedOffer = isSearching ? searchedOffers[indexPath.item] : offers[indexPath.item]
        cell.set(offer: selectedOffer)
        if favoriteOffers.contains(selectedOffer) {
            cell.isFavoritedImage.isHidden = false
        } else {
            cell.isFavoritedImage.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offersList = isSearching ? searchedOffers : offers
        let selectedOffer = offersList[indexPath.item]
        let vc = OfferDetailViewController()
        vc.offerDetail = selectedOffer
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OffersListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else { return }
        isSearching = true
        searchedOffers = offers.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
        self.offersCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        offersCollectionView.reloadData()
    }
}

