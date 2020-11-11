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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCollectionView()
        setupDataSource()
        updateData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: 24, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 80)
        
        return flowLayout
    }
    
    func setupCollectionView() {
        offersCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowLayout())
        view.addSubview(offersCollectionView)
        offersCollectionView.backgroundColor = .systemBackground
        offersCollectionView.register(OffersCollectionViewCell.self, forCellWithReuseIdentifier: OffersCollectionViewCell.reuseIdentifier)
    }
    
    func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Offer>(collectionView: offersCollectionView, cellProvider: { (collectionView, indexPath, offer) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.reuseIdentifier, for: indexPath) as! OffersCollectionViewCell
            cell.set(offer: offer)
            return cell
        })
    }
    
    func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Offer>()
        snapShot.appendSections([.main])
        snapShot.appendItems(offers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true, completion: nil)
        }
    }
}



