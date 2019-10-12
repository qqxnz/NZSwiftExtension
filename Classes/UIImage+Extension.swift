//
//  UIImage+Extension.swift
//  PerfectLove
//
//  Created by lv on 2019/9/29.
//  Copyright © 2019 lvfumei. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    /// 颜色转图片
    /// - Parameter color: 颜色
    static func nz_imageWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
