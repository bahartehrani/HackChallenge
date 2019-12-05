//
//  SpotsTableViewCell.swift
//
//
//  Created by Productivity on 12/3/19.
//

import UIKit
import SnapKit

class SpotsTableViewCell: UITableViewCell {

    let padding : CGFloat = 5
    var label : UILabel!
    var spotImage : UIImageView!
    var heartImageView : UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        
        label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        spotImage = UIImageView()
        spotImage.clipsToBounds = true
        spotImage.contentMode = .scaleAspectFit
        //image.image = UIImage(named: test)
        contentView.addSubview(spotImage)
        
        heartImageView = UIButton()
        heartImageView.setImage(UIImage(named: "heart"), for: .normal)
//        heartImageView.addTarget(self, action: #selector(toggleHeart(for: true)), for: .touchUpInside)
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        contentView.addSubview(heartImageView)
        
        setupConstraints()
    }
    
    func configure(for spot: Spot) {
        label.text = spot.name

    }
    
    @objc func toggleHeart(for isFavorite: Bool) {
        heartImageView.isHidden = !isFavorite
    }
    
    func setupConstraints() {
    
        label.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().offset(padding * 2)
            make.width.equalTo(padding * 15)
            
        }
        
        heartImageView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().offset(padding * 2)
            make.width.equalTo(padding * 4)
            make.height.equalTo(padding * 4)
        }
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
