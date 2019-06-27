//
//  RecommendViewController.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/16.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

private let kCycleViewH = kScreenH / 5
private let kGameViewH : CGFloat = 90

class RecommendViewController: BaseAnchorViewController {
    
    // MARK: - 懒加载属性
    private lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    private lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
//        print(kScreenW, kCycleViewH)
        
        return cycleView
    }()
    private lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    
}

// MARK: - 设置UI界面内容
extension RecommendViewController {
    override func setupUI() {
        // 1.将UICollectionView添加到控制器的view中
        super.setupUI()
        
        // 2.将CycleView添加到UICOllectionView中
        collectionView.addSubview(cycleView)
        
        // 3.将gameView添加到UICOllectionView中
        collectionView.addSubview(gameView)
        
        // 4.设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
        
    }
}

// MARK: - 请求数据
extension RecommendViewController {
    override func loadData() {
        // 0.给父类的ViewModel进行赋值
        baseVM = recommendVM
        
        // 1.请求推荐数据
        recommendVM.requestData {
            // 1.展示推荐数据
            self.collectionView.reloadData()
            
            // 2.将数据传递给GameView
            var groups = self.recommendVM.anchorGroups
            // 1.移除前两组数据
            groups.removeFirst()
            groups.removeFirst()
            // 2.添加 更多 组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            
            self.gameView.groups = groups
        }
        
        // 2.请求轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}

// MARK:- 遵守UICollectionViewDataSource
extension RecommendViewController : UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            prettyCell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            return prettyCell
        } else {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNoremalItemW, height: kPrettyItemH)
        } else {
            return CGSize(width: kNoremalItemW, height: kNormalItemH)
        }
    }
    
}
