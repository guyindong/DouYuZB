//
//  CollectionGameCell.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/24.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    // MARK: - 定义模型属性
    var group : AnchorGroup? {
        didSet {
            titleLable.text = group?.tag_name
            iconImageView.image = UIImage(named: "home_more_btn")
            guard let iconURL = URL(string: group?.icon_url ?? "") else { return  }
            let resource = ImageResource(downloadURL: iconURL)
            iconImageView.kf.setImage(with: resource, placeholder: UIImage(named: "home_more_btn"))
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
