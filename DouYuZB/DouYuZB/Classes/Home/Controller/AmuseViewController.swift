//
//  AmuseViewController.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/26.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class AmuseViewController: BaseAnchorViewController {

    // MARK: - 懒加载属性
    private lazy var amuseVM : AmuseViewModel = AmuseViewModel()
    
}

// MARK: - 请求数据
extension AmuseViewController {
    override func loadData() {
        // 0.给父类的ViewModel进行赋值
        baseVM = amuseVM
        
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
        }
    }
}




