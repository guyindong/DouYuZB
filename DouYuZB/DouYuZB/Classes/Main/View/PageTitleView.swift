//
//  PageTitleView.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/15.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView, selectedIndex index : Int)
}

private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {
    
    // MARK:- 定义属性
    private var currentIndex : Int = 0
    private var titles : [String]
    weak var delegate : PageTitleViewDelegate?
    
    // MARK:- 懒加载属性
    private lazy var titleLables : [UILabel] = [UILabel]()
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()

    // MARK:- 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        // 设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:- 设置UI界面
extension PageTitleView {
    private func setupUI() {
        // 1.添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2.添加title对应的Lable
        setupTitleLables()
        
        // 3.设置底线和滚动滑块
        setupBottomLineAndScrollLine()
    }
    private func setupTitleLables() {
        
        // 0.确实lable的frame值
        let lableW : CGFloat = frame.width / CGFloat(titles.count)
        let lableH : CGFloat = frame.height - kScrollLineH
        let lableY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            // 1.创建UILable
            let lable = UILabel()
            
            // 2.设置Lable的属性
            lable.text = title
            lable.tag = index
            lable.font = UIFont.systemFont(ofSize: 16.0)
            lable.textColor = UIColor.darkGray
            lable.textAlignment = .center
            
            // 3.设置lable的frame
            let lableX : CGFloat = lableW * CGFloat(index)
            lable.frame = CGRect(x: lableX, y: lableY, width: lableW, height: lableH)
            
            // 4.将lable添加到scrollView中
            scrollView.addSubview(lable)
            titleLables.append(lable)
            
            // 5.给Lable添加手势
            lable.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLableClick(tapGus:)))
            lable.addGestureRecognizer(tapGes)
            
        }
        
    }
    
    private func setupBottomLineAndScrollLine() {
        // 1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 2.添加ScrollView
        guard let firstLable = titleLables.first else { return }
        firstLable.textColor = UIColor.orange
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLable.frame.origin.x, y: frame.height - kScrollLineH, width: firstLable.frame.width, height: kScrollLineH)
    }
}

// MARK:- 监听Lable的点击
extension PageTitleView {
    @objc private func titleLableClick(tapGus : UITapGestureRecognizer) {
        // 1.获取当前Lable
        guard let currentLable = tapGus.view as? UILabel else { return }
        // 2.获取之前Lable
        let preLable = titleLables[currentIndex]
        // 2.2排除重复点击
        guard currentLable != preLable else {
            return
        }
        // 3.切换Lable颜色
        currentLable.textColor = UIColor.orange
        preLable.textColor = UIColor.darkGray
        // 4.保存最新的Lable下标
        currentIndex = currentLable.tag
        // 5.滚动条位置发生改变
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) {
            self.scrollLine.frame.origin.x = scrollLineX
        }
        // 6.通知代理
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
        
    }
}

// MARK:- 对外暴露的方法
extension PageTitleView {
    func setTitleWithProgress(progress : CGFloat, souceIndex : Int, targetIndex : Int) {
        
    }
}
