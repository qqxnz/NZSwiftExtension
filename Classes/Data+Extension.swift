//
//  Data+Extension.swift
//  pt
//
//  Created by lvfm on 2018/5/24.
//  Copyright © 2018年 lvfm. All rights reserved.
//

import Foundation

extension Data {
    /// 打印Data数据16进制字符串
    ///
    /// - returns: `String` representation of this `Data` object.
    func hexadecimal() -> String {
        return map { String(format: "%02x", $0) }
            .joined(separator: "")
    }
}
