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
    
    var category : UILabel!
    
    let padding : CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        category = UILabel()
        category.textColor = .white
        category.textAlignment = .center
        category.font = UIFont.boldSystemFont(ofSize: 12.0)
        category.layer.masksToBounds = true
        category.layer.cornerRadius = 12
        category.layer.backgroundColor = UIColor(red: 27/255, green: 26/255, blue: 46/255, alpha: 1.0).cgColor
        contentView.addSubview(category)
        
        setupConstraints()

    }
    
    func setupConstraints() {
        

        category.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    func configure(for cat : String) {
        category.text = cat
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

