//
//  Date+Extension.swift
//  owl
//
//  Created by lv on 2019/4/20.
//  Copyright © 2019 lv. All rights reserved.
//

import UIKit

public extension Date {
    /// 返回年
    func nz_year() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.year!
    }
    /// 返回月
    func nz_month() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.month!
        
    }
    
    ///返回中文月份汉字 ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
    func nz_monthInChinese()->String{
        let monthNum = self.nz_month()
        let ChinaArray = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
        let ChinaStr:String = ChinaArray[monthNum - 1]
        return ChinaStr
    }
    
    /// 返回日
    func nz_day() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.day!
        
    }
    /// 返回星期几
    func nz_weekDay()->Int{
        let interval = Int(self.timeIntervalSince1970)
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 4)%7+7)%7
        return weekday == 0 ? 7 : weekday
    }
    /// 返回本月天数
    func nz_countOfDaysInMonth() ->Int {
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
        return (range?.length)!
        
    }
    /// 当月第一天是星期几 1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    func nz_firstWeekDay() ->Int {
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let firstWeekDay = (calendar as NSCalendar?)?.ordinality(of: NSCalendar.Unit.weekday, in: NSCalendar.Unit.weekOfMonth, for: self)
        return firstWeekDay! - 1
        
    }
    ///是否是今天
    func nz_isToday()->Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month && com.day == comNow.day
    }
    ///是否是这个月
    func nz_isThisMonth()->Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month
    }
    
    
    /// Date转字符串
    /// - Parameter format: 字符串格式 举例:`yyyy-MM-dd HH:mm:ss`
    func nz_toString(format:String) -> String {
        let timeZone = NSTimeZone.local
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = format
        
        let date = formatter.string(from: self)
        return date
    }
    
    
    /// 比较当前时间并显示为（几分钟前，几小时前，几天前，几个月前，几年前）
    func nz_compareCurrentTime() -> String {
        let current = Date.init()
        let timeInterval = current.timeIntervalSince(self)
        var temp:Double = 0
        var result:String = ""

        if timeInterval/60 < 1 {

            result = "刚刚"

        }else if (timeInterval/60) < 60{

            temp = timeInterval/60

            result = "\(Int(temp))分钟前"

        }else if timeInterval/60/60 < 24 {

            temp = timeInterval/60/60

            result = "\(Int(temp))小时前"

        }else if timeInterval/(24 * 60 * 60) < 30 {

            temp = timeInterval / (24 * 60 * 60)

            result = "\(Int(temp))天前"

        }else if timeInterval/(30 * 24 * 60 * 60)  < 12 {

            temp = timeInterval/(30 * 24 * 60 * 60)

            result = "\(Int(temp))个月前"

        }else{

            temp = timeInterval/(12 * 30 * 24 * 60 * 60)

            result = "\(Int(temp))年前"

        }

        return result

    }
    
    
}



public extension Date{
    
    /// 日期时间字符串转Date类型
    /// - Parameter dateStr: 时间字符串
    /// - Parameter strFormat: dateStr的格式 举例:`yyyy-MM-dd HH:mm:ss`
    static func nz_fromString(dateStr:String,withFormat strFormat:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = strFormat
        let date
            = dateFormatter.date(from: dateStr)
        return date!
    }
    
    
    /// 计算两个时间A和B的天数差
    /// - Parameter dateA: 时间A
    /// - Parameter dateB: 时间B
    static func nz_dateDifference(_ dateA:Date, from dateB:Date) -> Double {
        let interval = dateA.timeIntervalSince(dateB)
        return interval/86400
    }
    

}
