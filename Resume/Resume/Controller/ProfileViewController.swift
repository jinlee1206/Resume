//
//  ProfileViewController.swift
//  Resume
//
//  Created by ROGER on 2018. 5. 25..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit


class ProfileViewController : UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var introduceLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
}





//MARK:- Life Cycle
extension ProfileViewController {
    
    override func viewDidLoad() {
        

        setupViews()
//        setupCollectionView()
        
    }
    

    
}


//MARK:- Setup SubViews
extension ProfileViewController {
    
    fileprivate func setupViews() {
        
        nameLabel.font = UIFont(name:"Futura", size: 18)
        
    }
    
}


////MARK:- Setup CollectionView
//extension ProfileViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//
////    fileprivate func setupCollectionView() {
////
////        self.collectionView.delegate = self
////        self.collectionView.dataSource = self
////
////    }
////
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////
////        return 4
////
////    }
////
////
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////
//////        let cell = self.collectionView.de
////
////    }
//
//}

extension ProfileViewController {
    
}
