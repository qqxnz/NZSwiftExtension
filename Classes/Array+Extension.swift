
//
//  Array+Extension.swift
//  pt
//
//  Created by lv on 2018/1/24.
//  Copyright © 2018年 lv. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    /// 删除数组中的某个数据
    /// - Parameter obj: 要删除的数据
    mutating func remove(_ obj: Element) {
        if let index = firstIndex(of: obj) {
            remove(at: index)
        }
    }
}
