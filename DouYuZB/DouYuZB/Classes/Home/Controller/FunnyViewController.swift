//
//  FunnyViewController.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/29.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

private let kTopMargin : CGFloat = 8

class FunnyViewController: BaseAnchorViewController {

    private lazy var funnyVM : FunnyViewModel = FunnyViewModel()
    
}

extension FunnyViewController {
    override func setupUI() {
        super.setupUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0)
    }
}

extension FunnyViewController {
    override func loadData() {
        baseVM = funnyVM
        
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
        }
    }
}
