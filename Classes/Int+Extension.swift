//
//  Int+Extension.swift
//  PerfectLove
//
//  Created by lv on 2019/10/12.
//  Copyright © 2019 lvfumei. All rights reserved.
//

import Foundation

extension Int {
    
    /// 1-9的数字前补0
    func nz_addZeroBeforeToString() -> String{
        
        if(self < 10 && self > 0){
            return "0" + String(self)
        }
        
        return String(self)
    }
    

    
}
