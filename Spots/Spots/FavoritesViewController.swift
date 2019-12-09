//
//  FavoritesViewController.swift
//  Spots
//
//  Created by Productivity on 11/18/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    var tableView : UITableView!
    let reuseIdentifier = "favoritesCellReuse"
    var faveSpots : [Spot] = []
    let padding : CGFloat = 8
    var viewTitle : UILabel!
    //gradient
    var gradient: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        
        
        viewTitle = UILabel()
        viewTitle.textAlignment = .center
        viewTitle.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        viewTitle.text = "Favorite Spots"
        viewTitle.font = UIFont.boldSystemFont(ofSize: 32.0)
        view.addSubview(viewTitle)
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        tableView.register(SpotsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        gradient = UIImageView(image: UIImage(named: "Gradient"))
        gradient.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradient)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        viewTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 7)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 20)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalToSuperview().offset(padding*3)
            make.trailing.equalToSuperview().offset(-padding*3)
        }
        
        gradient.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalToSuperview()
        }
    }
    
    func updateFaves() {
        faveSpots = FaveSpots.sharedFaveSpots
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFaves()
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.reloadData()
    } 
}


extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faveSpots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SpotsTableViewCell
        
        cell.faveConfigure(for: faveSpots[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

     
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
