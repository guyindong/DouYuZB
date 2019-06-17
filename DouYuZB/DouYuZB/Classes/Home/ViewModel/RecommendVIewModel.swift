//
//  RecommendVIewModel.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/17.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class RecommendVIewModel {
    // MARK: - 懒加载属性
    private lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    
}

// MARK: - 发送网络请求
extension RecommendVIewModel {
    func requestData() {
        // 1. 请求第一部分数据
        
        // 2. 请求第二部分数据
        
        // 3. 请求第三部分数据
        // http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1560755532
        //print(NSDate.getCurrentTime() as NSString)
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime() as NSString]) { (result) in
            //print(result)
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            //print(resultDict)
            // 2.根据data-kay,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            //print(dataArray)
            // 3.遍历数组，获取字典，并且将字典转成模型对象
            for dict in dataArray {
                let group = AnchorGroup(dict: dict)
                self.anchorGroups.append(group)
            }
            for group in self.anchorGroups {
                for anchor in group.anchors {
                    print(anchor.nickname)
                }
                print("-----")
            }
        }
    }
}
