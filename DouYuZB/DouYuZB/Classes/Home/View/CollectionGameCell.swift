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
    var baseGame : BaseGameModel? {
        didSet {
            titleLable.text = baseGame?.tag_name
            guard let iconURL = URL(string: baseGame?.icon_url ?? "") else {
                iconImageView.image = UIImage(named: "home_more_btn")
                return
            }
            //let resource = ImageResource(downloadURL: iconURL)
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "home_more_btn"))
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
