//
//  CollectionBaseCell.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/17.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionBaseCell: UICollectionViewCell {
    // MARK: - 控件属性
    @IBOutlet var srcImageView: UIImageView!
    @IBOutlet var onlineBtn: UIButton!
    @IBOutlet var nickNameLabel: UILabel!
    
    // MARK: - 定义模型属性
    var anchor : AnchorModel? {
    
        didSet {
            // 0.校验模型是否有值
            guard let anchor = anchor  else { return }
            
            // 1.取出在线人数的文字
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online)/10000)万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            // 2.昵称的显示
            nickNameLabel.text = anchor.nickname
            
            // 3.设置封面图片
            guard let srcURL = URL(string: anchor.vertical_src) else { return }
            let resource = ImageResource(downloadURL: srcURL)
            srcImageView.kf.setImage(with: resource)
        }
        
    }
}
