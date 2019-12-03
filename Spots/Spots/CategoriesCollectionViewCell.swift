//
//  CategoriesCollectionViewCell.swift
//  Spots
//
//  Created by Productivity on 11/18/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import UIKit
import SnapKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    var categoriesLabel : UILabel!
    
    let padding : CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        categoriesLabel = UILabel()
        categoriesLabel.textColor = .white
        
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoriesLabel)
        setupConstraints()

    }
    
    
    
    func setupConstraints() {
        
        categoriesLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func configure(for category : String) {
        categoriesLabel.text = category
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

