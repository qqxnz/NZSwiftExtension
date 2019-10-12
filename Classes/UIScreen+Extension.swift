//
//  UIScreen+Extension.swift
//  PerfectLove
//
//  Created by lv on 2019/10/12.
//  Copyright © 2019 lvfumei. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    /// 是否为IPHONE X 类型的刘海屏
    func isXScreen() -> Bool{
        if(UIScreen.main.bounds.size.height == 812.0 || UIScreen.main.bounds.size.height == 896.0){
            return true;
        }
        return false;
    }
}
