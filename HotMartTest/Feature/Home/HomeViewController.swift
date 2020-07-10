//
//  HomeViewController.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UICollectionViewController {
    
    var viewModel: HomeViewModel?
    
    private var refreshControl: UIRefreshControl?
    
    private let metrics = UIEdgeInsets(top: 16.0,
    left: 24.0,
    bottom: 16.0,
    right: 24.0)

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    public init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        super.init(collectionViewLayout: layout)
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        collectionView.register(LocationCell.self, forCellWithReuseIdentifier: LocationCell.defaultReuseIdentifier)
        self.refreshControl = UIRefreshControl()
        collectionView.backgroundColor = .white
        collectionView.refreshControl = refreshControl
       refreshControl!.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
       title = "home.title".localizable
        
       bind()
   }
    
    func bind() {
        viewModel?.reloadTable.bind({ [unowned self] _ in
            self.collectionView.reloadData()
            self.refreshControl?.endRefreshing()
        })
        
        viewModel?.error.bind({ (error) in
            
        })
        
        viewModel?.start()
    }
    
    @objc private func refreshData(_ sender: Any) {
        viewModel?.fetch()
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = metrics.left * 3
        let availableWidth = self.view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 2
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        metrics
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        metrics.left
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.quantity ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  LocationCell.defaultReuseIdentifier, for: indexPath) as! LocationCell
        if let location = viewModel?[indexPath.row] {
           let cellViewModel = LocationCellViewModel(location: location)
           cell.viewModel = cellViewModel
        }
        return cell
    }
}

