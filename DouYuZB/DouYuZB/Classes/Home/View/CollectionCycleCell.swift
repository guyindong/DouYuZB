//
//  CollectionCycleCell.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/24.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {
    
    // MARK: - 控件属性
    
    @IBOutlet weak var cycleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - 定义模型属性
    var cycleModel : CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let cycleURL = URL(string: cycleModel?.pic_url ?? "")!
            let resource = ImageResource(downloadURL: cycleURL)
            cycleImageView.kf.setImage(with: resource)
        }
    }
    
}
