//
//  StarsView.swift
//  HotMartTest
//
//  Created by rogerio on 10/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

public enum StarsType{
    case small
    case normal
}

extension StarsType {
    var onName: String  {
        switch self {
        case .small:
            return "starOnSmall"
        case .normal:
            return "starOn"
        }
    }
    
    var offName: String  {
        switch self {
        case .small:
            return "starOffSmall"
        case .normal:
            return "starOff"
        }
    }
}

class StarsView: UIView {
        
    var type: StarsType = .normal
    var count: Int? {
        didSet {
            setStars()
        }
    }
    
    private func getStar(named: String) -> UIImageView {
        let uImage = UIImageView()
        uImage.image = UIImage(named: named)
        uImage.translatesAutoresizingMaskIntoConstraints = false
        uImage.backgroundColor = .clear
        return uImage
    }
           
    private lazy var stack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addSubview(stack)
        
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    private func setStars() {
        _ = stack.arrangedSubviews.map { (view) in
            view.removeFromSuperview()
        }
        
        
        for i in 0...4 {
            var starName = type.offName
            if (i < (self.count ?? 0)) {
                starName = type.onName
            }
            let image = getStar(named: starName)
            image.contentMode = .scaleAspectFit
            stack.addArrangedSubview(image)
        }
    }
    
}
