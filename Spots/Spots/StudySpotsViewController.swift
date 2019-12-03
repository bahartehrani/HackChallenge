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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "???"
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.itemSize = CGSize(width: 20, height: 10)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: categoriesCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        view.addSubview(collectionView)
        
        categories = ["Open", "Closed", "Quiet"]
        
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding * 6)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(6 * padding)
            
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
        
        let height : CGFloat = 15
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
