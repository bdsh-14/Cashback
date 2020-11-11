//
//  ViewController.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/10/20.
//

import UIKit

class OffersListViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var offersCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Offer>!
    
    let offers = Offer.offersFromJson()
    var searchedOffers: [Offer] = []
    var isSearching: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCollectionView()
        setupDataSource()
        updateData(with: offers)
        setupSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData(with: offers)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setup() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Offers"
    }
    
    func createTwoColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12 //padding on left and right edges
        let minimumSpacing: CGFloat = 8
        let availableWidth = width - (padding * 2) - minimumSpacing
        let itemWidth = availableWidth/2
        
        let flowLayout = UICollectionViewFlowLayout()
        
        // TODO: fix section inset
        
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 24, right: 8)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
    
    func setupCollectionView() {
        offersCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowLayout())
        view.addSubview(offersCollectionView)
        offersCollectionView.backgroundColor = .systemBackground
        offersCollectionView.delegate = self
        offersCollectionView.register(OffersCollectionViewCell.self, forCellWithReuseIdentifier: OffersCollectionViewCell.reuseIdentifier)
    }
    
    func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Offer>(collectionView: offersCollectionView, cellProvider: { (collectionView, indexPath, offer) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.reuseIdentifier, for: indexPath) as! OffersCollectionViewCell
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.systemBlue.cgColor
            cell.set(offer: offer)
            return cell
        })
    }
    
    func updateData(with offers: [Offer]) {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Offer>()
        snapShot.appendSections([.main])
        snapShot.appendItems(offers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true, completion: nil)
        }
        isSearching = false
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


extension OffersListViewController: UICollectionViewDelegate {
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
        updateData(with: searchedOffers)
        // TODO: if no search results are found, handle it somehow (maybe empty state)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(with: offers)
    }
    
    //TODO: fix cross on search bar
}



