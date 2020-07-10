//
//  HomeViewController.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UITableViewController {
    
    var viewModel: HomeViewModel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
       tableView.register(LocationCell.self, forCellReuseIdentifier: LocationCell.defaultReuseIdentifier)
       self.refreshControl = UIRefreshControl()
        view.backgroundColor = .white
       if #available(iOS 10.0, *) {
           tableView.refreshControl = refreshControl
       } else {
           tableView.addSubview(refreshControl!)
       }
       tableView.rowHeight = UITableView.automaticDimension
       tableView.estimatedRowHeight = 120
       refreshControl!.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
//
//       NSLayoutConstraint.activate([
//           loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//           loading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//       ])
       
       //title = "currencies.title".localizable
       bind()
   }
    
    func bind() {
        viewModel?.reloadTable.bind({ [unowned self] _ in
            self.tableView.reloadData()
        })
        
        viewModel?.error.bind({ (error) in
            
        })
        
        viewModel?.start()
    }
    
    @objc private func refreshData(_ sender: Any) {
        
    }
    
    
}

extension HomeViewController {
    
        override func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return viewModel?.quantity ?? 0
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.defaultReuseIdentifier, for: indexPath) as! LocationCell
        
        if let location = viewModel?[indexPath.row] {
           let cellViewModel = LocationCellViewModel(location: location)
           cell.viewModel = cellViewModel
        }
                      
        return cell
    }
}

