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
    var pinkOrGray : Bool!
    
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
        heartImageView.setImage(UIImage(named: "greyHeart"), for: .normal)
        pinkOrGray = false
        heartImageView.addTarget(self, action: #selector(toggleHeart), for: .touchUpInside)
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.contentMode = .scaleAspectFit
        contentView.addSubview(heartImageView)
        
        setupConstraints()
    }
    
    func configure(for spot: Spot) {
        label.text = spot.title
        spot.isFavorite = pinkOrGray
    }
    
    @objc func toggleHeart() {
        if (!pinkOrGray) {
            heartImageView.setImage(UIImage(named: "pinkHeart"), for: .normal)
        }
        else {
            heartImageView.setImage(UIImage(named: "greyHeart"), for: .normal)
        }
        pinkOrGray = !pinkOrGray
        
        
    }
    
    func setupConstraints() {
    
        // TODO: constraint w snp messes up table view
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding * 2)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: 20),
            heartImageView.widthAnchor.constraint(equalToConstant: 23),
                        heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            heartImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding * 4)
        ])

        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


