//
//  String+Extension.swift
//  pt
//
//  Created by wheng on 2017/12/4.
//  Copyright © 2017年 wheng. All rights reserved.
//

import Foundation


extension String {
    
    
    /// 判断是否为空（全空格）
    ///
    /// - Returns: 是否为空（全空格）
    func nz_isAllEmpty() -> Bool {
        if self.isEmpty {
            return true
        }
        
        let set = NSCharacterSet.whitespacesAndNewlines
        let triStr = self.trimmingCharacters(in: set)
        if triStr.count == 0 {
            return true
        } else {
            return false
        }
    }
    
    
//    /**获取字符串的md5值*/
//    func nz_md5() -> String {
//        let cStrl = self.cString(using: String.Encoding.utf8);
//        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16);
//        CC_MD5(cStrl, CC_LONG(strlen(cStrl!)), buffer);
//        var md5String = "";
//        for idx in 0...15 {
//            let obcStrl = String.init(format: "%02x", buffer[idx]);
//            md5String.append(obcStrl);
//        }
//        free(buffer);
//        return md5String;
//    }
    
    
    /// 获取汉字字符串首字母(简易)
    ///
    /// - Returns: 返回大写首字母
    func nz_getFirstUpCharacter() -> String {
        let str = NSMutableString.init(string: self)
        CFStringTransform(str  as CFMutableString, nil, kCFStringTransformToLatin, false)
        
        let pinyin = str.folding(options: String.CompareOptions.diacriticInsensitive, locale: Locale.current).uppercased()
        
        let upFirst = String(pinyin.prefix(upTo: pinyin.index(pinyin.startIndex, offsetBy: 1)))
        
        return upFirst
    }
    
    
    /// 根据开始位置和长度截取字符串
    /// - Parameter start: 开始位置
    /// - Parameter length: 截取长度
    func nz_subString(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        if(self.count < len){
            return ""
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
    

    
    /// 是否包含中文
    func nz_iscontainChinese() -> Bool {
        for char in self {
            if ("\u{4E00}" <= char  && char <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
    

}

extension String {
    
    /// String to Int
    func nz_toIntValue() ->Int{
        let str = self
        var intValue:Int = 0;
        if let value = Int(str){
            intValue = value
        }
        return intValue
    }
    
    /// String to Double
    func nz_toDoubleValue() ->Double{
        let str = self
        var doubleValue:Double = 0.0;
        if let value = Double(str){
            doubleValue = value
        }
        return doubleValue
    }
    
    
    /// 将原始的url编码为合法的url
    func nz_urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    /// url出现特殊字符处理
    func nz_urlCharacterSet()->String{
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.init(charactersIn: "!*'();:@&=+$,/?%#[]").inverted)
        return encodeUrlString ?? ""
    }
    
    /// 将编码后的url转换回原始的url
    func nz_urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}

extension String{
    /// 转拼音
    func nz_transformToPinYin()->String{
        let mutableString = NSMutableString(string: self)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        return string
    }
    /// 邮箱格式检查
    func nz_isLegalEmail()->Bool{
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let test:NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    /// 移动号码检查
    func nz_isLegalChinaMobilePhone()->Bool{
        let regex = "^1[0-9]{10,12}$"
        let test:NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    /// 固定号码检查
    func nz_isLegalChinaFixedPhone()->Bool{
        let regex = "\\d{3,4}-\\d{7,8}"
        let test:NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    
    /// 身份证格式检查
   func nz_isLegalChinaIDCardNumber()->Bool{
        let regex = "(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)"
        let test:NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }

}

extension String {
    /// 下标数字 0
    static var nz_zeroUnder: String {
        return "\u{2080}"
    }
    
    /// 下标数字 1
    static var nz_oneUnder: String {
        return "\u{2081}"
    }
    
    /// 下标数字 2
    static var nz_twoUnder: String {
        return "\u{2082}"
    }
    
    /// 下标数字 3
    static var nz_threeUnder: String {
        return "\u{2083}"
    }
    
    /// 下标数字 4
    static var nz_fourUnder: String {
        return "\u{2084}"
    }
    
    /// 下标数字 5
    static var nz_fiveUnder: String {
        return "\u{2085}"
    }
    
    /// 下标数字 6
    static var nz_sixUnder: String {
        return "\u{2086}"
    }
    
    /// 下标数字 7
    static var nz_sevenUnder: String {
        return "\u{2087}"
    }
    
    /// 下标数字 8
    static var nz_eightUnder: String {
        return "\u{2088}"
    }
    
    /// 下标数字 9
    static var nz_nineUnder: String {
        return "\u{2089}"
    }
    
    /// 下标字母 m
    static var nz_mUnder: String {
        return "\u{2098}"
    }
    
    /// 上标数字 0
    static var nz_zeroUpper: String {
        return "\u{2070}"
    }
    
    /// 上标数字 1
    static var nz_oneUpper: String {
        return "\u{2071}"
    }
    
    /// 上标数字 2
    static var nz_twoUpper: String {
        return "\u{2072}"
    }
    
    /// 上标数字 3
    static var nz_threeUpper: String {
        return "\u{2073}"
    }
    
    /// 上标数字 4
    static var nz_fourUpper: String {
        return "\u{2074}"
    }
    
    /// 上标数字 5
    static var nz_fiveUpper: String {
        return "\u{2075}"
    }
    
    /// 上标数字 6
    static var sixUpper: String {
        return "\u{2076}"
    }
    
    /// 上标数字 7
    static var nz_sevenUpper: String {
        return "\u{2077}"
    }
    
    /// 上标数字 8
    static var nz_eightUpper: String {
        return "\u{2078}"
    }
    
    /// 上标数字 9
    static var nz_nineUpper: String {
        return "\u{2079}"
    }
    
}
