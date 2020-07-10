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

class StarsView: UIView {
        
    var type: StarsType?
    var count: Int? {
        didSet {
            setStars()
        }
    }
    
    private func getStar(named: String) -> UIImageView {
        let uImage = UIImageView()
        uImage.image = UIImage(named: named)
        uImage.translatesAutoresizingMaskIntoConstraints = false
        uImage.backgroundColor = .white
        return uImage
    }
    
    private lazy var starImage: UIImageView  = {
        let uImage = UIImageView()
        uImage.translatesAutoresizingMaskIntoConstraints = false
        uImage.backgroundColor = .white
        return uImage
    }()
    
    private lazy var starImage2: UIImageView  = {
        let uImage = UIImageView()
        uImage.translatesAutoresizingMaskIntoConstraints = false
        uImage.backgroundColor = .white
        return uImage
    }()
    
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
            var starName = "starOffSmall"
            if (i < (self.count ?? 0)) {
                starName = "starOnSmall"
            }
            let image = getStar(named: starName)
            image.contentMode = .scaleAspectFit
            stack.addArrangedSubview(image)
        }
    }
    
}
