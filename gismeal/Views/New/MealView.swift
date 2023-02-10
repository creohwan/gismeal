//
//  MealView.swift
//  gismeal
//
//  Created by creohwan on 2023/02/09.
//

import SwiftUI

struct MealView: View {
    
    // environment
    @EnvironmentObject var networkManager: NetworkManager
    
    @Binding var selectedDate : Date

    var selectedRestaurant: Int
    var mealName = NameManagerKor().mealName
    let mealTime = TimeManger().timeMediumSize
    
    func setupRestaurantMenu(selectedRestaurant: Int) -> [Menu] {
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
        
        ScrollView(showsIndicators: false) {
            VStack {
                checkMenu(of: menu)
                Spacer().frame(height: 90)
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

    


