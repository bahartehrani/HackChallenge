//
//  ViewController.swift
//  Spots
//
//  Created by Productivity on 11/18/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

// Main page


import UIKit
import SnapKit

class StudySpotsViewController: UIViewController {
    
    var collectionView : UICollectionView!
    let padding : CGFloat = 8
    let categoriesCellReuseIdentifier = "categoriesCellReuseIdentifier"
    var categories : [String]!
    var selectedFilters : [String] = []
    var viewTitle : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        
        viewTitle = UILabel()
        viewTitle.textAlignment = .center
        viewTitle.textColor = UIColor(red: 209/255, green: 211/255, blue: 217/255, alpha: 1.0)
        viewTitle.text = "Study Spots"
        viewTitle.font = UIFont.boldSystemFont(ofSize: 40.0)
        view.addSubview(viewTitle)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.itemSize = CGSize(width: 20, height: 10)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 23/255, alpha: 1.0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: categoriesCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        
        view.addSubview(collectionView)
        
        categories = ["Open", "Closed", "Quiet", "North", "West", "Central"]
        
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 15)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(6 * padding)
            
        }
        
        viewTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 4)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(50)
        }
    }

}

extension StudySpotsViewController : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoriesCellReuseIdentifier, for: indexPath) as! CategoriesCollectionViewCell
        
        cell.configure(for: categories[indexPath.row])
        
        return cell
    }
    
}

extension StudySpotsViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height : CGFloat = 22
        let width : CGFloat = (collectionView.frame.width - padding * 4) / 4
        
        return CGSize(width: width, height: height)
    }
    
}



extension StudySpotsViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedFilter = categories[indexPath.row]
        selectedFilters.append(selectedFilter)
    
    }
}
