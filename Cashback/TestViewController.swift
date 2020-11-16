//
//  TestViewController.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/15/20.
//

import UIKit

class TestViewController: UIViewController {
    
    var offersCollectionView: UICollectionView!
    let offers = Offer.offersFromJson()
    var searchedOffers: [Offer] = []
    var isSearching: Bool = false
    var favoriteOffers: [Offer] = []
    var favOfferIds: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Offers"
        getFavorites()
        setupCollectionView()

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
                self.favOfferIds = self.favoriteOffers.map({ $0.id })
            case .failure(let _):
                break
            }
        }
//
//        for i in favoriteOffers {
//            favOfferIds.append(i.id)
//        }
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
        let padding: CGFloat = 12 //padding on left and right edges
        let minimumSpacing: CGFloat = 8
        let availableWidth = width - (padding * 2) - minimumSpacing
        let itemWidth = availableWidth/2
        
        let flowLayout = UICollectionViewFlowLayout()
        
        // TODO: fix section inset
        
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 6, bottom: 6, right: 8)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
}

extension TestViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.reuseIdentifier, for: indexPath) as! OffersCollectionViewCell
        
        cell.set(offer: offers[indexPath.item])
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
