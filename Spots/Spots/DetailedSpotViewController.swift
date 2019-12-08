//
//  DetailedSpotViewController.swift
//  Spots
//
//  Created by Productivity on 11/18/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import UIKit

class DetailedSpotViewController: UIViewController {

    var viewTitle : UILabel!
    var zoomedPic : UIImageView!
    
    var popTimes : UILabel!
    var popTimesImage : UIImageView!
    
    var resName : UILabel!
    var resources : UILabel!
    
    let padding : CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        
        viewTitle = UILabel()
        viewTitle.textAlignment = .center
        viewTitle.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        viewTitle.text = "Spot"
        viewTitle.font = UIFont.boldSystemFont(ofSize: 32.0)
        view.addSubview(viewTitle)
        
        setupConstraints()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupConstraints() {
        
        viewTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 20)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(50)
        }
    }
}


