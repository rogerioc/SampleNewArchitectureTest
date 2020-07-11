//
//  TypeInfoView.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

enum TypeInfo {
    case phone
    case time
    case address
}

extension TypeInfo {
    var icon: UIImage {
        switch self {
        case .phone:
            return .phone
        case .address:
            return .address
        case .time:
            return .time
        }
    }
}

struct DataInfo {
    let type: TypeInfo
    let value: String
}

public class TypeInfoView: UIView {
    
    var type: TypeInfo? {
        didSet {
            guard let type = type else { return }
            icons.image = type.icon
        }
    }
    
    var value: String? {
        didSet {
            guard let value = value else { return }
            valueText.text = value
        }
    }
    
    
   private lazy var icons: UIImageView = {
        let uimage = UIImageView(frame: .zero)
        uimage.contentMode = .scaleAspectFit
        return uimage
    }()
    
    private lazy var valueText: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .textStyle7
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .darkGraphite
        return label
    }()
    
    private  lazy var stackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [icons, valueText])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 1
        stackview.alignment = .trailing
        stackview.distribution = .fillProportionally
        stackview.axis = .horizontal
        return stackview
    }()
    
    private lazy var myView: UIView = {
        let view = UIView(frame: .zero)
        view.addSubview(stackView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    private func setupViews() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            icons.topAnchor.constraint(equalTo: stackView.topAnchor)
        ])
    }
}
