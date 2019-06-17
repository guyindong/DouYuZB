//
//  AnchorGroup.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/17.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject {
    // 该组中对应的房间信息
    @objc var room_list : [[String : NSObject]]? {
        didSet {
            guard let room_list = room_list else { return }
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    // 该组显示的标题
    @objc var tag_name : String = ""
    // 该组显示的图标
    @objc var icon_name : String = "home_header_normal"
    // 定义主播的模型对象数组
    lazy var anchors : [AnchorModel] = [AnchorModel]()
    
    // MARK: - 构造函数
    override init() {
        
    }
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        print(key)
    }
    /*
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "room_list" {
            if let dataArray = value as? [[String : NSObject]] {
                for dict in dataArray {
                    anchors.append(AnchorModel(dict: dict))
                }
            }
        }
    }
    */
}
