//
//  DetailedSpotViewController.swift
//  Spots
//
//  Created by Productivity on 11/18/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import UIKit

class DetailedSpotViewController: UIViewController {
    
    var tableView: UITableView!
    let reuseIdentifier = "detailedCellReuse"
    let cellHeight: CGFloat = 200
    var rows : [Detailed] = []
    let padding : CGFloat = 8

    var viewTitle : UILabel!
    var zoomedPic : UIImageView!
    
    
    
//    var hours : UILabel!
//
//    var popTimes : UILabel!
//    var popTimesImage : UIImageView!
//
//    var resName : UILabel!
//    var resources : UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d1 = Detailed(title: "Hours", imageTitle: "testing")
        let d2 = Detailed(title: "Popular Times", imageTitle: "testing")
        let d3 = Detailed(title: "Resources", imageTitle: "testing")
        rows = [d1, d2, d3]
        
        view.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        
        viewTitle = UILabel()
        viewTitle.textAlignment = .center
        viewTitle.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        viewTitle.text = theSpot.sharedSpot.title
        viewTitle.font = UIFont.boldSystemFont(ofSize: 32.0)
        view.addSubview(viewTitle)
        
        zoomedPic = UIImageView(image: UIImage(named: "Testing"))
        zoomedPic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zoomedPic)
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        tableView.register(DetailedViewTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
//        hours = UILabel()
//        hours.textAlignment = .left
//        hours.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
//        hours.text = "Hours"
//        viewTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
//        view.addSubview(hours)
//
//        popTimes = UILabel()
//        popTimes.textAlignment = .left
//        popTimes.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
//        popTimes.text = "Popular Times"
//        viewTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
//        view.addSubview(popTimes)
//
//        resources = UILabel()
//        resources.textAlignment = .left
//        resources.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
//        resources.text = "Hours"
//        viewTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
//        view.addSubview(resources)
        
        setupConstraints()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewTitle.text = theSpot.sharedSpot.title
        
        
        
        
        
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
        
//        hours.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(padding * 35)
//            make.leading.equalToSuperview().offset(padding)
//        }
//
//        popTimes.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(padding * 70)
//            make.leading.equalToSuperview().offset(padding)
//        }
//
//        resources.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(padding * 105)
//            make.leading.equalToSuperview().offset(padding)
//        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(padding * 35)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)

        }
    }
    
}

extension DetailedSpotViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
        tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DetailedViewTableViewCell
        cell.configure(for: rows[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension DetailedSpotViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

}
