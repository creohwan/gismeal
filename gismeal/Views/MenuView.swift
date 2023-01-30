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
    
    let dayIndex: Int
    let date: String
    
    let mealName = MealManager().mealName
    let mealTime = MealManager().timeMediumSize
    
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
        ScrollView {
            VStack {
                Text("\(month)월 \(day)일 \(weekday)")
                    .font(.title)
                    .bold()
                    .padding(.vertical, 10)
                CardView(mealName: mealName["breakfast"]!, mealTime: mealTime["breakfast"]!, mealMenu: String(menu.breakfast.dropLast(1)))
                CardView(mealName: mealName["lunch"]!, mealTime: mealTime["lunch"]!, mealMenu: String(menu.lunch.dropLast(1)))
                CardView(mealName: mealName["lunch_corner"]!, mealTime: mealTime["lunch_corner"]!, mealMenu: String(menu.lunch_corner.dropLast(1)))
                CardView(mealName: mealName["dinner"]!, mealTime: mealTime["dinner"]!, mealMenu: String(menu.dinner.dropLast(1)))
            }
        }
    }
    
    private func checkLunch(of menu: Menu) {
        if menu.lunch_corner == "\n\n" {
           
        }
    }
}
