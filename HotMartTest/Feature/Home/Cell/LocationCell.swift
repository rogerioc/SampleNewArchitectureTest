//
//  LocationCell.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

final class LocationCell: UICollectionViewCell {
    
    var viewModel: LocationCellViewModel? {
        didSet{
            bind()
        }
    }
    
    private let metrics = UIEdgeInsets(top: 16,
                                       left: 8.0,
                                       bottom: 16.0,
                                       right: 8.0)
    private let height = CGFloat(68)
    
    lazy var view : UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .topaz
        return view
    }()
    
    lazy var name: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .topaz
      label.font = .textStyle
      return label
    }()
    
    lazy var type: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brownishGrey
        label.font = .textStyle2
        return label
    }()
    
    lazy var starsView: StarsView = {
        let starsView = StarsView(frame: .zero)
        starsView.translatesAutoresizingMaskIntoConstraints = false
       return starsView
    }()
      
    lazy var stackData: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,type, starsView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
      
      // MARK: Init
     override init(frame: CGRect) {
        super.init(frame: frame)
        bind()
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 5
        layer.masksToBounds = true
        contentView.addSubview(view)
        contentView.addSubview(stackData)
                
        NSLayoutConstraint.activate([
            stackData.heightAnchor.constraint(equalToConstant: height),
            stackData.topAnchor.constraint(equalTo: view.bottomAnchor),
            stackData.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -metrics.bottom),
            stackData.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -metrics.left),
            stackData.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: metrics.right),
            starsView.leadingAnchor.constraint(equalTo: stackData.leadingAnchor),
            name.centerXAnchor.constraint(equalTo: stackData.centerXAnchor),
            type.centerXAnchor.constraint(equalTo: stackData.centerXAnchor),
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: stackData.topAnchor)
        ])
        bind()
    }
                 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        bind()
    }

    func bind() {
        viewModel?.locationData.bind({ [unowned self] (location) in
            self.name.text = location.name
            self.type.text = location.type
            self.starsView.count = Int(location.review)
        })
        
        viewModel?.start()
    }
}
