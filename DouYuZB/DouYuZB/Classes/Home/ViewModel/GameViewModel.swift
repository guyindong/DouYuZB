//
//  GameViewModel.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/25.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

class GameViewModel {

    lazy var games : [GameModel] = [GameModel]()
    
}

extension GameViewModel {
    // http://capi.douyucdn.cn/api/v1/getColumnDetail?is_game_cate=1
    func loadAllGameData(finishedCallback : @escaping () -> ()) {
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["is_game_cate" : "1"]) { (result) in
            guard let resultDict = result as? [String : Any] else { return}
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            for dict in dataArray {
                self.games.append(GameModel(dict: dict))
            }
            finishedCallback()
        }
    }
}
