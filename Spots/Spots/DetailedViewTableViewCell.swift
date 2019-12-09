//
//  DetailedViewTableViewCell.swift
//  Spots
//
//  Created by Angela Chen on 12/8/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import UIKit

class DetailedViewTableViewCell: UITableViewCell {

    var titleLabel : UILabel!
    var detailedImageView: UIImageView!
    
    var popTimes : UILabel!
    var popTimesImage : UIImageView!
    
    var resName : UILabel!
    var resources : UILabel!
    
    let padding : CGFloat = 8
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        titleLabel.text = "Hours"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        contentView.addSubview(titleLabel)
        
        detailedImageView = UIImageView(image: UIImage(named: "Testing"))
        detailedImageView.contentMode = .scaleAspectFit
        contentView.addSubview(detailedImageView)
        

                
        setupConstraints()
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview().offset(padding)
        }
        
        detailedImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.bottom.equalToSuperview().offset(-padding)
        }

    }
    
    func configure (for detail: Detailed) {
        titleLabel.text = detail.title
        detailedImageView.image = UIImage(named: detail.imageTitle)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
