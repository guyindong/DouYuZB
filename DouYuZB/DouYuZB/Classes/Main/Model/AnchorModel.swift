//
//  AnchorModel.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/17.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    
    @objc var room_id : Int = 0
    @objc var vertical_src : String = ""
    @objc var isVertical : Int = 0
    @objc var room_name : String = ""
    @objc var nickname : String = ""
    @objc var online : Int = 0
    @objc var anchor_city : String = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //        print(key)
    }
}
