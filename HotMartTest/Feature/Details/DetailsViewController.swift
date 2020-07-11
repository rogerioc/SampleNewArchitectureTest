//
//  DetailsViewController.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

final class DetailsViewController: UIViewController {
    
    var viewModel: DetailsViewModel? {
        didSet {
            bind()
        }
    }
    
    private let metrics = UIEdgeInsets(top: 16,
                                       left: 8.0,
                                       bottom: 16.0,
                                       right: 16.0)
    private lazy var loading: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.activityIndicatorViewStyle = .gray
        return indicator
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .textStyle4
        label.textColor = .white
        return label
    }()
    
    private lazy var locationNameView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .topaz
        return view
    }()
    
    private lazy var starsView: StarsView = {
        let stView = StarsView(frame: .zero)
        stView.translatesAutoresizingMaskIntoConstraints = false
        stView.type = .normal
        stView.backgroundColor = .clear
        return stView
    }()
    
    private lazy var review: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .textStyle2
        label.textColor = .white
        return label
    }()
    
    private lazy var stackReview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [starsView, review])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillEqually
        stackview.axis = .horizontal
        return stackview
    }()
    
    private lazy var stackName: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [name,stackReview])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = metrics.top/2
        stackview.axis = .vertical
        return stackview
    }()
    
    
    private lazy var aboutTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .textStyle
        label.text = Texts.detailAbout.uppercased()
        label.textColor = .topaz
        return label
    }()
    
    private lazy var aboutValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .textStyle6
        label.text = Texts.detailAbout
        label.textColor = .darkGraphite
        label.sizeToFit()
        label.numberOfLines = 0

        return label
    }()
    
    private lazy var phoneInfo: TypeInfoView = {
        let typeInfoView = TypeInfoView(frame: .zero)
        typeInfoView.type = .phone
        return typeInfoView
    }()
    
    private lazy var addressInfo: TypeInfoView = {
        let typeInfoView = TypeInfoView(frame: .zero)
        typeInfoView.type = .address
        return typeInfoView
    }()
    
    private lazy var stackInfos: UIStackView = {
        let stackview = UIStackView(frame: .zero)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = metrics.top
        stackview.axis = .vertical
        return stackview
    }()
    
    private lazy var customView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

    }
    
    public func setupViews() {
        locationNameView.addSubview(stackName)
        customView.addSubview(locationNameView)
        customView.addSubview(stackInfos)
        view.backgroundColor = .white
        stackInfos.addArrangedSubview(aboutTitle)
        stackInfos.addArrangedSubview(aboutValue)
        stackInfos.addArrangedSubview(phoneInfo)
        stackInfos.addArrangedSubview(addressInfo)
        view.addSubview(customView)
        view.addSubview(loading)
        loading.center = view.center
        
        NSLayoutConstraint.activate([
            locationNameView.topAnchor.constraint(equalTo: view.topAnchor),
            locationNameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationNameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackName.topAnchor.constraint(equalTo: locationNameView.topAnchor,constant: metrics.top),
            stackName.trailingAnchor.constraint(equalTo: locationNameView.trailingAnchor),
            stackName.leadingAnchor.constraint(equalTo: locationNameView.leadingAnchor, constant: metrics.right),
            stackName.bottomAnchor.constraint(equalTo: locationNameView.bottomAnchor, constant: -metrics.bottom),
            stackInfos.topAnchor.constraint(equalTo: locationNameView.bottomAnchor, constant: metrics.top),
            stackInfos.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -metrics.left),
            stackInfos.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: metrics.right),
            phoneInfo.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -view.frame.width/2),
            addressInfo.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -view.frame.width/2)
        ])
        
    }
    
    private func bind() {
        guard let viewModel = viewModel else { return }
        
        viewModel.details.bind({ [unowned self] (detailsViewEntity) in
            self.name.text = detailsViewEntity.name
            self.starsView.count = detailsViewEntity.starsON
            self.review.text = detailsViewEntity.review
            self.aboutValue.text = detailsViewEntity.about
            self.phoneInfo.value = detailsViewEntity.phone
            self.addressInfo.value = detailsViewEntity.address
        })
        
        viewModel.showScreen.bind { [unowned self] (show) in
            if(!show) {
              self.loading.startAnimating()
            } else {
              self.loading.stopAnimating()
            }
            self.loading.isHidden = show
            self.customView.isHidden = !show
        }
        
        viewModel.showErro.bind { [unowned self] (error) in
            self.loading.stopAnimating()
            
        }
        
        viewModel.start()
    }
    
    
    
}
