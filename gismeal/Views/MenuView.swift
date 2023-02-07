//
//  MenuView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/25.
//

import SwiftUI

struct MenuView: View {
    
    // environment
    @EnvironmentObject var networkManager: NetworkManager
    @Binding var language: Bool
    
    let dayIndex: Int
    let date: String

    var mealName = NameManagerKor().mealName
    let mealTime = TimeManger().timeMediumSize
    // TODO: - 학생 식당 이름 변경
    var mealPlace = "2학생식당"
    
    init(dayIndex: Int, date: String, selectedLanguage: Binding<Bool> = .constant(true)) {
        _language = selectedLanguage
        self.dayIndex = dayIndex
        self.date = date
        
        if language {
            self.mealName = NameManagerKor().mealName
            self.mealPlace = "2학생식당"
        } else {
            self.mealName = NameManagerEng().mealName
            self.mealPlace = "2nd Student Restaurant"
        }
    }
    
    var body: some View {
        
        let returnedDate = networkManager.getDate(of: date)
        let month = returnedDate["month"]!
        let day = returnedDate["day"]!
        let weekday = returnedDate["weekday"]!
        
        let menusList = [networkManager.firstDayMenus,
                         networkManager.secondDayMenus,
                         networkManager.thirdDayMenus,
                         networkManager.fourthDayMenus,
                         networkManager.fifthDayMenus]
        
        let menu = menusList[dayIndex]
        VStack {
            Text("\(month)월 \(day)일 \(weekday)")
                .font(.title)
                .bold()
                .padding(.vertical, 5)
            // TODO: - 학생회관 추가시 수정 필요
            Text(mealPlace)
                .font(.title3)
                .bold()
                .padding(.vertical, 2)
            ScrollView(showsIndicators: false) {
                VStack {
                    checkMenu(of: menu)
                }
            }
        }

    }
    
    private func checkMenu(of menu: Menu) -> AnyView {
        if menu.breakfast == "" && menu.lunch == "" && menu.lunch_corner == "" && menu.dinner == "" {
            return AnyView(EmptyCardView())
        }
        return isLunchConerEmpty(of: menu)
    }
    
    private func isLunchConerEmpty(of menu: Menu) -> AnyView {
        if menu.lunch_corner == "\n" || menu.lunch_corner == ""  {
            return AnyView(VStack {
                CardView(mealName: mealName["breakfast"]!, mealTime: mealTime["breakfast"]!, mealMenu: String(menu.breakfast.dropLast(1))).padding(.vertical,1)
                CardView(mealName: mealName["lunch"]!, mealTime: mealTime["lunch"]!, mealMenu: String(menu.lunch.dropLast(1))).padding(.vertical,1)
                CardView(mealName: mealName["dinner"]!, mealTime: mealTime["dinner"]!, mealMenu: String(menu.dinner.dropLast(1))).padding(.vertical,1)
            })
        } else {
            return AnyView(VStack {
                CardView(mealName: mealName["breakfast"]!, mealTime: mealTime["breakfast"]!, mealMenu: String(menu.breakfast.dropLast(1))).padding(.vertical,1)
                CardView(mealName: mealName["lunch_corner"]!, mealTime: mealTime["lunch_corner"]!, mealMenu: String(menu.lunch_corner.dropLast(1))).padding(.vertical,1)
                CardView(mealName: mealName["lunch"]!, mealTime: mealTime["lunch"]!, mealMenu: String(menu.lunch.dropLast(1))).padding(.vertical,1)
                CardView(mealName: mealName["dinner"]!, mealTime: mealTime["dinner"]!, mealMenu: String(menu.dinner.dropLast(1))).padding(.vertical,1)
            })
        }
    }
}

    


