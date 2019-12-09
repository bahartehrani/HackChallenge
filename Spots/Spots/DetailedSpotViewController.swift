//
//  DetailedSpotViewController.swift
//  Spots
//
//  Created by Productivity on 11/18/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import UIKit

class DetailedSpotViewController: UIViewController {
    
    let cellHeight: CGFloat = 200
    let padding : CGFloat = 8

    var viewTitle : UILabel!
    var zoomedPic : UIImageView!

    var hours : UILabel!
    var showHours : UILabel!

    var popTimes : UILabel!
    var popTimesImage : UIImageView!

    var resName : UILabel!
    var resources : UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        
        viewTitle = UILabel()
        viewTitle.textAlignment = .center
        viewTitle.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        viewTitle.text = theSpot.sharedSpot.name
        viewTitle.font = UIFont.boldSystemFont(ofSize: 32.0)
        view.addSubview(viewTitle)
        
        zoomedPic = UIImageView(image: UIImage(named: "Testing"))
        zoomedPic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zoomedPic)
        
        hours = UILabel()
        hours.textAlignment = .left
        hours.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        hours.text = "Today's Hours"
        viewTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
        view.addSubview(hours)
        
        showHours = UILabel()
        showHours.textAlignment = .left
        showHours.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        showHours.text = theSpot.sharedSpot.opening + " - " + theSpot.sharedSpot.closing
        showHours.font = UIFont.boldSystemFont(ofSize: 28.0)
        view.addSubview(showHours)
        
        popTimes = UILabel()
        popTimes.textAlignment = .left
        popTimes.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        popTimes.text = "Popular Times"
        viewTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
        view.addSubview(popTimes)

        popTimesImage = UIImageView(image: UIImage(named: "popTimes"))
        popTimesImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popTimesImage)
        
        resources = UILabel()
        resources.textAlignment = .left
        resources.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        resources.text = "Resources"
        viewTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
        view.addSubview(resources)
        
        setupConstraints()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewTitle.text = theSpot.sharedSpot.name
        showHours.text = theSpot.sharedSpot.opening + " - " + theSpot.sharedSpot.closing
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupConstraints() {
        
        viewTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 28.5)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(50)
        }
        
        zoomedPic.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(220)
            make.width.equalToSuperview()
        }
        
        hours.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 35)
            make.leading.equalToSuperview().offset(padding)
        }
        
        showHours.snp.makeConstraints { make in
            make.top.equalTo(hours.snp.bottom).offset(padding * 3)
            make.centerX.equalTo(view.snp.centerX)
        }

        popTimes.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 50)
            make.leading.equalToSuperview().offset(padding)
        }
        
        popTimesImage.snp.makeConstraints { make in
            make.top.equalTo(popTimes.snp.bottom).offset(padding * 3)
            make.width.equalTo(325)
            make.height.equalTo(140)
            make.centerX.equalTo(view.snp.centerX)
        }

        resources.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 75)
            make.leading.equalToSuperview().offset(padding)
        }
        
    }
    
}


