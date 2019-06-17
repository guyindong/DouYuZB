//
//  CollectionHeaderView.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/16.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    // MARK: - 控件属性
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    // MARK: - 模型属性
    var group : AnchorGroup? {
        didSet {
            titleLable.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
}
