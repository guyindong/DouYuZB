//
//  UIBarButtonItem-Extension.swift
//  DouYuZB
//
//  Created by 顾尹东 on 2019/6/14.
//  Copyright © 2019 顾尹东. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    // 类方法
    class func createItem(imageName : String, highlightImageName : String, size : CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highlightImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        return UIBarButtonItem(customView: btn)
    }
     */
    
    // 便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数（self）
    convenience init (imageName : String, highlightImageName : String = "", size : CGSize = CGSize.zero) {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highlightImageName != "" {
            btn.setImage(UIImage(named: highlightImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        } else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
    }
    
}
