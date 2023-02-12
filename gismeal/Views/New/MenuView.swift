//
//  MealView.swift
//  gismeal
//
//  Created by creohwan on 2023/02/09.
//

import SwiftUI

struct MenuView: View {
    
    // environment
    @EnvironmentObject var networkManager: NetworkManager
    
    @Binding var selectedDate : Date

    var selectedRestaurant: Int
    var mealName = NameManagerKor().mealName
    let mealTime = TimeManger().timeMediumSize
    
    func setupRestaurantMenu(selectedRestaurant: Int) -> [MenuForm] {
        if selectedRestaurant == 1 {
            return [networkManager.R1Day1Menus,
                    networkManager.R1Day2Menus,
                    networkManager.R1Day3Menus,
                    networkManager.R1Day4Menus,
                    networkManager.R1Day5Menus]
        } else {
            return [networkManager.R2Day1Menus,
                    networkManager.R2Day2Menus,
                    networkManager.R2Day3Menus,
                    networkManager.R2Day4Menus,
                    networkManager.R2Day5Menus]
        }
    }
    
    var body: some View {
        let selectedDayIndex = selectedDate.getDayIndex()
        let menusList = setupRestaurantMenu(selectedRestaurant: selectedRestaurant)
        let menu = menusList[selectedDayIndex]
        let key = menu.returnBool()
        ScrollView(showsIndicators: false) {
            VStack {
                if key == [false, false, false, false, false] {
                    if (selectedDate.getDayOfWeekShort() == "토" || selectedDate.getDayOfWeekShort() == "일") && selectedRestaurant == 1 {
                        EmptyCard1stWeekView()
                    } else {
                        EmptyCardView()
                    }
                } else {
                    if key[0] {
                        CardView(mealName: mealName["breakfast"]!, mealTime: mealTime["breakfast"]!, mealMenu: menu.breakfast)
                    }
                    if key[1] {
                        CardView(mealName: mealName["lunch_corner"]!, mealTime: mealTime["lunch_corner"]!, mealMenu: menu.lunch_corner)
                    }
                    if key[2] {
                        CardView(mealName: mealName["lunch"]!, mealTime: mealTime["lunch"]!, mealMenu: menu.lunch)
                    }
                    if key[3] {
                        CardView(mealName: mealName["lunch_corner_2"]!, mealTime: mealTime["lunch_corner_2"]!, mealMenu: menu.lunch_corner_2)
                    }
                    if key[4] {
                        CardView(mealName: mealName["dinner"]!, mealTime: mealTime["dinner"]!, mealMenu: menu.dinner)
                    }
                    Spacer().frame(height: 90)
                }
            }
        }
    }
}

    


