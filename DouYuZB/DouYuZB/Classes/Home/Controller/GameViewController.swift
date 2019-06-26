//
//  GameViewController.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/25.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenW - 2*kEdgeMargin) / 3
private let kItemH : CGFloat = kItemW * 6 / 5
private let kHeaderViewH : CGFloat = 50
private let kCommonViewH : CGFloat = 90

private let kGameCellID = "kGameCellID"
private let kHeaderViewCellID = "kHeaderViewCellID"

class GameViewController: UIViewController {

    // MARK: - 懒加载
    private lazy var gameVM : GameViewModel = GameViewModel()
    private lazy var collectionView : UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenH, height: kHeaderViewH)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewCellID)
        
        return collectionView
    }()
    private lazy var topHeaderView : CollectionHeaderView = {
        let headerView = CollectionHeaderView.collectionHeaderView()
        headerView.frame = CGRect(x: 0, y: -(kHeaderViewH + kCommonViewH), width: kScreenW, height: kHeaderViewH)
        headerView.titleLable.text = "常用"
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.moreBtn.isHidden = true
        
        return headerView
    }()
    private lazy var commonView : RecommendGameView = {
        let commonView = RecommendGameView.recommendView()
        commonView.frame = CGRect(x: 0, y: -kCommonViewH, width: kScreenW, height: kCommonViewH)
        
        return commonView
    }()
    
    // MARK: - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
        loadData()
        
    }
}

// MARK: - 设置UI界面
extension GameViewController {
    private func setupUI() {
        // 1.添加UICollectionView
        view.addSubview(collectionView)
        // 2.添加顶部的HeaderView
        collectionView.addSubview(topHeaderView)
        
        // 3.将常用游戏的View，添加到UICollectionView中
        collectionView.addSubview(commonView)
        
        // 4.设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kHeaderViewH + kCommonViewH, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - 请求数据
extension GameViewController {
    private func loadData() {
        gameVM.loadAllGameData {
            // 1.展示全部游戏
            self.collectionView.reloadData()
            
            // 2.展示常用游戏
            self.commonView.groups = Array(self.gameVM.games[0..<10])
        }
    }
}

// MARK: - 遵守UICollectionView的数据源&代理
extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
        cell.baseGame = gameVM.games[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewCellID, for: indexPath) as! CollectionHeaderView
        headerView.titleLable.text = "全部"
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.moreBtn.isHidden = true
        return headerView
    }
}
