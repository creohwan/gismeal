//
//  TimeManager.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//
import Foundation

// 포스텍
struct TimeManager {

    let schedule = [
        "BREAKFAST_A" : "~ 09:30",
        "BREAKFAST_B" : "~ 09:30",
        "LUNCH" : "~ 13:30",
        "DINNER" : "~ 19:00",
        "STAFF" : "13:00",
        "INTERNATIONAL" : "13:30"
    ]

    let scheduleMediumSize = [
        "BREAKFAST_A" : "07:30 ~ 09:30",
        "BREAKFAST_B" : "07:30 ~ 09:30",
        "LUNCH" : "11:30 ~ 13:30",
        "DINNER" : "17:30 ~ 19:00",
        "STAFF" : "11:50 ~ 13:00",
        "INTERNATIONAL" : "11:30 ~ 13:30"
    ]

    let mealNameDict = [
        "BREAKFAST_A" : "조식",
        "BREAKFAST_B" : "간단식",
        "LUNCH" : "중식",
        "DINNER" : "석식",
        "STAFF" : "위즈덤",
        "INTERNATIONAL" : "더 블루힐"
    ]
}

// 지스트
struct MealManager {

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

    let mealName = [
        "breakfast" : "조식",
        "lunch" : "중식(일반식)",
        "lunch_corner" : "중식(특식)",
        "dinner" : "석식"
    ]
}
