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
    
        categoriesLabel.textAlignment = .center
        //categoriesLabel.font = UIFont(name: categoriesLabel.font.fontName, size: 15)
        categoriesLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        categoriesLabel.layer.masksToBounds = true
        categoriesLabel.layer.cornerRadius = 12
        
        categoriesLabel.layer.backgroundColor = UIColor(red: 27/255, green: 26/255, blue: 46/255, alpha: 1.0).cgColor
        
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

