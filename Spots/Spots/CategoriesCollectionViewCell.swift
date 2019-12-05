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
    
    var spotName : UILabel!
    var image : UIImageView!
    
    let padding : CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        spotName = UILabel()
        spotName.textColor = .white
        spotName.textAlignment = .center
        spotName.font = UIFont.boldSystemFont(ofSize: 12.0)
        spotName.layer.masksToBounds = true
        spotName.layer.cornerRadius = 12
        spotName.layer.backgroundColor = UIColor(red: 27/255, green: 26/255, blue: 46/255, alpha: 1.0).cgColor
        contentView.addSubview(spotName)
        
        image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        //image.image = UIImage(named: test)
        contentView.addSubview(image)

        setupConstraints()

    }
    
    func setupConstraints() {
        
        
        
        
        
        spotName.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    func configure(for category : String) {
        spotName.text = category
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

