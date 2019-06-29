//
//  FunnyViewModel.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/29.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class FunnyViewModel : BaseViewModel{

}

extension FunnyViewModel {
    func loadFunnyData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(isGroupsData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/2", paremeters: ["limit" : "30", "offset" : 0], finishedCallback: finishedCallback)

    }
    
}
