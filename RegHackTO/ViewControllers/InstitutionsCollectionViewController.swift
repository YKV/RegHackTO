//
//  InstitutionsCollectionViewController.swift
//  RegHackTO
//
//  Created by Yevhen Kim on 2016-11-26.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

final class InstitutionsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Arrays
    let institutions = ["zurich.png", "BMO.png", "Canada_Life.png", "CIBC.png", "Libro.png", "NB.png", "OSC.png", "OSFI.png", "PP.png", "RBC.png", "ScotiaBank.png", "TD.png", "TOEnterprise.png"]
    // MARK: - Properties
    fileprivate let reuseIdentifier = "Cell"
    fileprivate let sectionInsets = UIEdgeInsetsMake(60.0, 20.0, 50.0, 20.0)
    fileprivate let itemsPerRow: CGFloat = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
    }



}

// MARK: - UICollectionViewDataSource
extension InstitutionsCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return institutions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InstitutionImageCell
        
        
        cell.imageView.image = UIImage(named:self.institutions[indexPath.item])
        cell.backgroundColor = UIColor.black
        cell.layer.cornerRadius = 35
        return cell
        
    }
}

// MARK: - UICollectionViewDelegate
extension InstitutionsCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // push to another view controller
    }
}




































