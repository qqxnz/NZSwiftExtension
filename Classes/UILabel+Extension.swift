//
//  UILabel+Extension.swift
//  owl
//
//  Created by lv on 2019/5/15.
//  Copyright © 2019 lv. All rights reserved.
//

import UIKit

public extension UILabel {
    ///增加下划线
    func nz_underline(){
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
    
}
