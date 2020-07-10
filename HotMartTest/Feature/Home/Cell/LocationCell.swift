//
//  LocationCell.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

class LocationCell: UITableViewCell {
    
    var viewModel: LocationCellViewModel? {
        didSet{
            bind()
        }
    }
    
     lazy var name: UILabel = {
          let label = UILabel(frame: .zero)
          label.translatesAutoresizingMaskIntoConstraints = false
          label.textColor = .black
          return label
      }()
      
      lazy var stackData: UIStackView = {
          let stackView = UIStackView(arrangedSubviews: [name])
          stackView.translatesAutoresizingMaskIntoConstraints = false
          stackView.distribution = .equalSpacing
          stackView.spacing = 16
          stackView.axis = .vertical
          return stackView
      }()
      
      // MARK: Init
         
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         contentView.addSubview(stackData)
                
        NSLayoutConstraint.activate([
            stackData.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            stackData.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 1),
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        bind()
     }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        bind()
    }
    
    func bind() {
        viewModel?.name.bind({ [unowned self] (name) in
            self.name.text = name
        })
        
        viewModel?.start()
    }
}
