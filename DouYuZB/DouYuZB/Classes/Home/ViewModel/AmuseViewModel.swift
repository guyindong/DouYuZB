//
//  AmuseVIewModel.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/27.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class AmuseViewModel : BaseViewModel{

    
}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
