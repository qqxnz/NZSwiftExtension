
//
//  Color+Extension.swift
//  club
//
//  Created by lv on 2017/11/24.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /**
     16进制转UIColor
     
     - parameter hex: 16进制
     
     - returns: UIColor
     */
    convenience init(_ hex: Int, alpha: CGFloat = 1) {
        
        func transform(_ input: Int, offset: Int = 0) -> CGFloat {
            let value = (input >> offset) & 0xff
            return CGFloat(value) / 255
        }
        
        self.init(red: transform(hex, offset: 16), green: transform(hex, offset: 8), blue: transform(hex), alpha: alpha)
    }
    
    
    /**
     生成随机颜色
     
     - returns: 返回随机色
     */
    class func randomColor() -> UIColor
    {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
}

