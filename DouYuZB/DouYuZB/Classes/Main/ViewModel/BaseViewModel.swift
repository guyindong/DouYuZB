//
//  BaseViewModel.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/27.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class BaseViewModel {
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadAnchorData(URLString : String, paremeters : [String : Any]? = nil, finishedCallback : @escaping () -> ()) {
        NetworkTools.requestData(type: .GET, URLString: URLString, parameters: paremeters) { (result) in
            
            guard let resultDict = result as? [String : Any] else { return}
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            for dict in dataArray {
                self.anchorGroups.append(AnchorGroup(dict: dict))
            }
            finishedCallback()
        }
    }
}
