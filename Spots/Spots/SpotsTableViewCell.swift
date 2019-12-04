//
//  SpotsTableViewCell.swift
//
//
//  Created by Productivity on 12/3/19.
//

import UIKit

class SpotsTableViewCell: UITableViewCell {

    let padding : CGFloat = 5
    var label : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        
        label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        setupConstraints()
    }
    
    func configure(for spot: Spot) {
        label.text = spot.name

    }
    
    func setupConstraints() {
    
    NSLayoutConstraint.activate([
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
        label.heightAnchor.constraint(equalToConstant: 30),
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
