//
//  SpotsTableViewCell.swift
//
//
//  Created by Productivity on 12/3/19.
//

import UIKit
import SnapKit

class SpotsTableViewCell: UITableViewCell {

    var thisSpot : Spot = Spot(name: "")
    let padding : CGFloat = 5
    var pinkOrGray : Bool!
    // components
    var label : UILabel!
    var spotImage : UIImageView!
    var heartImageView : UIButton!
    var openCloseLabel : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        
        label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        spotImage = UIImageView()
        spotImage.clipsToBounds = true
        // rounded edges
        spotImage.layer.cornerRadius = 8.0
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
        
        openCloseLabel = UILabel()
        openCloseLabel.textAlignment = .center
        openCloseLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        openCloseLabel.layer.cornerRadius = 10
        openCloseLabel.layer.masksToBounds = true
        openCloseLabel.textColor = UIColor(red: 183/255, green: 65/255, blue: 136/255, alpha: 1.0)
        openCloseLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(openCloseLabel)
        
        setupConstraints()
    }
    
    func configure(for spotx: Spot) {
        thisSpot = spotx
        label.text = spotx.name
        if(spotx.isopening) {
            openCloseLabel.text = "OPEN"
        }
        else {
            openCloseLabel.text = "CLOSED"
        }
        pinkOrGray = spotx.isFavorite
        if(!spotx.isFavorite) {
            heartImageView.setImage(UIImage(named: "greyHeart"), for: .normal)
        }
        
        getSpotImage()
    }
    
    func faveConfigure(for spot: Spot) {
        thisSpot = spot
        label.text = spot.name
        spot.isFavorite = true
        pinkOrGray = true
        heartImageView.setImage(UIImage(named: "pinkHeart"), for: .normal)
        getSpotImage()
    }
    
    func getSpotImage() {
        NetworkManager.fetchSpotImage(imageURL: thisSpot.imageurl) { imageSp in
            DispatchQueue.main.async {
                self.spotImage.image = imageSp
            }
        }
    }

    @objc func toggleHeart() {
        if (!pinkOrGray) {
            heartImageView.setImage(UIImage(named: "pinkHeart"), for: .normal)
            thisSpot.isFavorite = true
            FaveSpots.sharedFaveSpots.append(thisSpot)
        }
        else {
            heartImageView.setImage(UIImage(named: "greyHeart"), for: .normal)
            if(FaveSpots.sharedFaveSpots.count != 0) {
                var i = 0
                var index = 0
                while i < FaveSpots.sharedFaveSpots.count {
                    
                    if(FaveSpots.sharedFaveSpots[i].equals(spot: thisSpot)) {
                        index = i
                    }
                    i += 1
                }
                
                FaveSpots.sharedFaveSpots.remove(at: index)
                thisSpot.isFavorite = false
            }
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
            spotImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            spotImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: 20),
            heartImageView.widthAnchor.constraint(equalToConstant: 23),
                        heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            heartImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding * 4)
        ])
        
        NSLayoutConstraint.activate([
            openCloseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            openCloseLabel.heightAnchor.constraint(equalToConstant: 25),
            openCloseLabel.widthAnchor.constraint(equalToConstant: 60),
            openCloseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding * 2)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


