//
//  RecommendVIewModel.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/17.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class RecommendViewModel {
    // MARK: - 懒加载属性
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    private lazy var hot_anchorGroups : AnchorGroup = AnchorGroup()
    private lazy var pretty_anchorGroups : AnchorGroup = AnchorGroup()
    
}

// MARK: - 发送网络请求
extension RecommendViewModel {
    func requestData(finishCallback : @escaping () -> ()) {
        // 0.定义参数
        let parameters = ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime() as NSString]
        // 0.1 创建dispatchGroup
        let disGroup = DispatchGroup()
        
        
        // 1. 请求第一部分数据
        disGroup.enter()
        //http://capi.douyucdn.cn/api/v1/getbigDataRoom?time=1560755532
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : NSDate.getCurrentTime() as NSString]) { (result) in
            //print(result)
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            //print(resultDict)
            // 2.根据data-kay,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            //print(dataArray)
            // 3.遍历数组，获取字典，并且将字典转成模型对象

            // 3.1 设置组的属性
            self.hot_anchorGroups.tag_name = "热门"
            self.hot_anchorGroups.icon_name = "home_header_hot"
            // 3.2 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.hot_anchorGroups.anchors.append(anchor)
            }
            disGroup.leave()
            
        }
        
        // 2. 请求第二部分数据
        disGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getVerticalRoom?
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            //print(result)
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            //print(resultDict)
            // 2.根据data-kay,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            //print(dataArray)
            // 3.遍历数组，获取字典，并且将字典转成模型对象
            // 3.1 设置组的属性
            self.pretty_anchorGroups.tag_name = "颜值"
            self.pretty_anchorGroups.icon_name = "home_header_phone"
            // 3.2 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.pretty_anchorGroups.anchors.append(anchor)
            }
            disGroup.leave()
            
        }
        
        // 3. 请求第三部分数据
        disGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1560755532
        //print(NSDate.getCurrentTime() as NSString)
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { (result) in
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
            /*
            for group in self.anchorGroups {
                for anchor in group.anchors {
                    print(anchor.nickname)
                }
                print("-----")
            }
            */
            disGroup.leave()
            
        }
        // 0.2 所有的数据都请求道，之后进行排序
        disGroup.notify(queue: .main) {
            self.anchorGroups.insert(self.pretty_anchorGroups, at: 0)
            self.anchorGroups.insert(self.hot_anchorGroups, at: 0)
            
            finishCallback()
        }
    }
}
