//
//  DateExtension.swift
//  gismeal
//
//  Created by creohwan on 2023/02/09.
//

import Foundation

extension Date {
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.locale = Locale(identifier: "ko")
        return dateFormatter.string(from: self).capitalized
    }

    func getMonthAndDayKor() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일"
        dateFormatter.locale = Locale(identifier: "ko")
        return dateFormatter.string(from: self).capitalized
    }

    func getDayOfWeekShort() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E"
            dateFormatter.locale = Locale(identifier: "ko")
            return dateFormatter.string(from: self).capitalized
        }

    func getDayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ko")
        return dateFormatter.string(from: self).capitalized
    }
//
//    func getMonthAndDay() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM.dd"
//        dateFormatter.locale = Locale(identifier: "ko")
//        return dateFormatter.string(from: self).capitalized
//    }
    
    func getDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        dateFormatter.locale = Locale(identifier: "ko")
        return dateFormatter.string(from: self).capitalized
    }
    
    func getDayIndex() -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.locale = Locale(identifier: "ko")
        
        if dateFormatter.string(from: currentDate).capitalized == dateFormatter.string(from: self).capitalized {
            return 0
        } else {
            return calendar.dateComponents([.day], from: currentDate, to: self ).day! + 1
        }
    }
}
