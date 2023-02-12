//
//  TimeManager.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//
import Foundation

struct NameManagerKor {
    let mealName = [
        "breakfast" : "아침",
        "lunch" : "점심(일반)",
        "lunch_corner" : "점심(코너)",
        "lunch_corner_2" : "점심(르네상스)",
        "dinner" : "저녁"
    ]
    
    let widgetMealName = [
        "breakfast" : "아침",
        "lunch" : "점심(일반)",
        "lunch_corner" : "점심(코너)",
        "lunch_corner_2" : "점심(르네)",
        "dinner" : "저녁"
    ]
    
    let widgetSettingMealName = [
        "breakfast" : "오늘 아침",
        "lunch" : "오늘 점심(일반)",
        "lunch_corner" : "오늘 점심(코너)",
        // TODO:- 추후 르네 업데이트 되면 수정해야 함
//        "lunch_corner" : "오늘 점심(코너, 르네)",
        "dinner" : "오늘 저녁",
        "onTime" : "시간에 맞추기"
    ]
}

struct NameManagerEng {
    let mealName = [
        "breakfast" : "Breakfast",
        "lunch" : "Lunch(basic)",
        "lunch_corner" : "Lunch(corner)",
        "dinner" : "Dinner"
    ]
    
    let widgetMealName = [
        "breakfast" : "Breakfast",
        "lunch" : "Lunch\n(basic)",
        "lunch_corner" : "Lunch\n(corner)",
        "dinner" : "Dinner"
    ]
}


struct TimeManger {
    let timeMiniSize = [
        "breakfast" : "~ 09:30",
        "lunch" : "~ 13:30",
        "lunch_corner" : "~ 13:30",
        "lunch_corner_2" : "~13:00",
        "dinner" : "~ 18:30",
    ]

    let timeMediumSize = [
        "breakfast" : "08:00 ~ 09:00",
        "lunch" : "11:30 ~ 13:30",
        "lunch_corner" : "11:30 ~ 13:30",
        "lunch_corner_2" : "11:00 ~13:00",
        "dinner" : "17:00 ~ 18:30",
    ]
}
