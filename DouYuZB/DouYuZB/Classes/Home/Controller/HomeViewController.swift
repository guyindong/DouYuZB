//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/14.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI界面
        setupUI()
        
    }
}

// MARK:- 设置UI界面
extension HomeViewController {
    private func setupUI() {
        // 1.设置导航栏
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        // 1.设置左侧的Item
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highlightImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highlightImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highlightImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
        
        
    }
}
