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
        "dinner" : "저녁"
    ]
    
    let widgetMealName = [
        "breakfast" : "아침",
        "lunch" : "점심(일반)",
        "lunch_corner" : "점심(코너)",
        "dinner" : "저녁"
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
        "dinner" : "~ 18:30",
    ]

    let timeMediumSize = [
        "breakfast" : "08:00 ~ 09:00",
        "lunch" : "11:30 ~ 13:30",
        "lunch_corner" : "11:30 ~ 13:30",
        "dinner" : "17:00 ~ 18:30",
    ]
}
