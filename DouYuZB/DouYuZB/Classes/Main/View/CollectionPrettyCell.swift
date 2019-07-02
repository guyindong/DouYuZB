//
//  CollectionPrettyCell.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/16.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class CollectionPrettyCell: CollectionBaseCell {
    
    // MARK: - 控件属性
    @IBOutlet var cityBtn: UIButton!
    
    // MARK: - 定义模型属性
    override var anchor : AnchorModel? {
        didSet {
            // 1.将属性传递给父类
            super.anchor = anchor
            // 2.所在城市
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
            
        }
    }

}
