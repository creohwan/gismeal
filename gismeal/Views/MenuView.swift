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
    
    let mealName = TimeManager().mealNameDict
    let mealTime = TimeManager().scheduleMediumSize
    
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
        
        VStack {
            Text("\(month)월 \(day)일 \(weekday)")
                .font(.title)
                .bold()
                .padding(.vertical, 10)
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(menusList[dayIndex]) { menu in
                        // CARD
                        VStack(alignment: .leading) {
                            // Title
                            HStack {
                                // Name
                                Text(mealName[menu.type]!)
                                    .bold()
                                Spacer()
                                // Time
                                Text(mealTime[menu.type]!)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.black)
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 5)
                                    .background(Color.backgroundColor)
                                    .cornerRadius(20)
                            }
                            // Food
                            VStack(alignment: .leading, spacing: 6) {
                                ForEach(menu.foods) { food in
                                    let check = food.isMain == true ? "*" : ""
                                    Text(food.name_kor + check)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                        .frame(width: 300, alignment: .leading)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
}

