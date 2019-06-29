//
//  AmuseViewController.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/26.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

private let kMenmuViewH : CGFloat = 200

class AmuseViewController: BaseAnchorViewController {

    // MARK: - 懒加载属性
    private lazy var amuseVM : AmuseViewModel = AmuseViewModel()
    private lazy var menuView : AmuseMenuView = {
        let menuView = AmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0, y: -kMenmuViewH, width: kScreenW, height: kMenmuViewH)
        return menuView
    }()
    
}

// MARK: - 设置UI界面
extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
        
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenmuViewH, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - 请求数据
extension AmuseViewController {
    override func loadData() {
        // 0.给父类的ViewModel进行赋值
        baseVM = amuseVM
        
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
            
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            
            self.menuView.groups = tempGroups
        }
    }
}




