//
//  ViewController.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/10/20.
//

import UIKit

class OffersListViewController: UIViewController {
    
    var offersCollectionView: UICollectionView!
    
    let offers = Offer.offersFromJson()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCollectionView()
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
    
    func setupCollectionView() {
        offersCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        view.addSubview(offersCollectionView)
        offersCollectionView.backgroundColor = .systemPink
        offersCollectionView.register(OffersCollectionViewCell.self, forCellWithReuseIdentifier: OffersCollectionViewCell.reuseIdentifier)
    }
}

