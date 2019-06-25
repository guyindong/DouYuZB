//
//  CollectionHeaderView.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/16.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionHeaderView: UICollectionReusableView {
    
    // MARK: - 控件属性
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    // MARK: - 模型属性
    var group : AnchorGroup? {
        didSet {
            titleLable.text = group?.tag_name
            guard group?.icon_name == "" else {
                iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
                return
            }
            guard let iconURL = URL(string: group?.small_icon_url ?? "") else {
                iconImageView.image = UIImage(named: "home_header_normal")
                return
            }
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "home_header_normal"))
        }
    }
    
}
