//
//  DetailedViewTableViewCell.swift
//  Spots
//
//  Created by Angela Chen on 12/8/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import UIKit

class DetailedViewTableViewCell: UITableViewCell {

    var title : UILabel!
    
    var popTimes : UILabel!
    var popTimesImage : UIImageView!
    
    var resName : UILabel!
    var resources : UILabel!
    
    let padding : CGFloat = 8
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        title = UILabel()
        title.textAlignment = .left
        title.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        title.text = "Hours"
        title.font = UIFont.boldSystemFont(ofSize: 15.0)
        contentView.addSubview(title)

                
        //setupConstraints()
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview().offset(padding)
        }

    }
    
    func configure (for detail: Detailed) {
        title.text = detail.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
