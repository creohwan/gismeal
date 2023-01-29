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
        "BREAKFAST" : "~ 09:30",
        "LUNCH_A" : "~ 13:30",
        "LUNCH_B" : "~ 13:30",
        "DINNER" : "~ 18:30",
    ]

    let timeMediumSize = [
        "BREAKFAST" : "08:00 ~ 09:00",
        "LUNCH_A" : "11:30 ~ 13:30",
        "LUNCH_B" : "11:30 ~ 13:30",
        "DINNER" : "17:00 ~ 18:30",
    ]

    let mealName = [
        "BREAKFAST" : "조식",
        "LUNCH_A" : "중식",
        "LUNCH_B" : "중식(특식)",
        "DINNER" : "석식"
    ]
}
