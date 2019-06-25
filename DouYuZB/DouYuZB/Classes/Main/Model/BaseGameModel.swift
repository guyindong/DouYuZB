//
//  BaseGameModel.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/25.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

@objcMembers
class BaseGameModel: NSObject {

    // 该组显示的标题
    var tag_name : String = ""
    
    // 游戏对应的图标
    var small_icon_url : String = ""
    var icon_url : String = ""
    
    // MARK: - 构造函数
    override init() {
        
    }
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {    }
}
