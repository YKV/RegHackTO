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
    @IBOutlet weak var checkImageView: UIImageView!
    
    // MARK: - Arrays
    let institutions = ["zurich.png", "BMO.png", "Canada_Life.png", "CIBC.png", "Libro.png", "NB.png", "OSC.png", "OSFI.png", "PP.png", "RBC.png", "ScotiaBank.png", "TD.png", "TOEnterprise.png"]
    var addToList = [IndexPath]()
    var didSendDocs: Bool?
    
    // MARK: - Properties
    fileprivate let reuseIdentifier = "Cell"
    fileprivate let sectionInsets = UIEdgeInsetsMake(60.0, 20.0, 50.0, 20.0)
    
    let stylesheet: Styles = Styles.sharedInstance
    //let listVC: ListTableViewController? = ListTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        //didSend()

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        //didSend()
        collectionView?.reloadItems(at: self.addToList)
    }

//    func didSend() {
//        if ((listVC?.didSend!) != nil) {
//            self.didSendDocs = listVC?.didSend!
//        }
//    }
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
        if (AppDelegate.didSend) != nil {
            
            cell.layer.borderColor = stylesheet.greenColor.cgColor
            cell.layer.borderWidth = 2
            cell.imageView.alpha = 0.5
            cell.checkImageView.alpha = 1.0
        }

        cell.layer.borderColor = stylesheet.lightgrayColor.cgColor
        cell.layer.borderWidth = 1
 
        return cell
        
    }
}

// MARK: - UICollectionViewDelegate
extension InstitutionsCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.addToList.append(indexPath)
        // push to another view controller
        let listVC: ListTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "ListVC") as! ListTableViewController
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(listVC, animated: true)
        }
    }
}




































