//
//  CollectionNormalCell.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/16.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {

    // MARK: - 控件属性
    @IBOutlet var roomNameLabel: UILabel!
    
    // MARK: - 定义模型属性
    override var anchor : AnchorModel? {
        didSet {
            // 1.将属性传递给父类
            super.anchor = anchor
            // 4.房间名称
            roomNameLabel.text = anchor?.room_name
        }
    }

}
