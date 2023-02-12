//
//  WidgetSettingView.swift
//  gismeal
//
//  Created by creohwan on 2023/02/11.
//

import SwiftUI
import WidgetKit

struct WidgetSettingView: View {
    
    @EnvironmentObject var networkManager: NetworkManager
    
    @Binding var selectedRestaurant: Int
    @Binding var selectedMenu: Int
    
    let mealNameDict = NameManagerKor().widgetSettingMealName
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("위젯에 보일 내용을 선택하세요")
                    .font(.title2)
                Spacer().frame(height: 30)
                HStack {
                    settingTitleViewBuilder(settingTitle: "식당 설정")
                    Divider().frame(width: 30, height: 100)
                    VStack {
                        restaurantViewBuilder(restaurantInt: 0, restaurantTitle: "1학생식당")
                        restaurantViewBuilder(restaurantInt: 1, restaurantTitle: "2학생식당")
                    }
                }
                Spacer().frame(height: 50)
                HStack {
                    settingTitleViewBuilder(settingTitle: "메뉴 설정")
                    Divider().frame(width: 30, height: 280)
                    VStack {
                        mealViewBuilder(menuInt: 1, menuTitle: "breakfast")
                        mealViewBuilder(menuInt: 2, menuTitle: "lunch_corner")
                        mealViewBuilder(menuInt: 3, menuTitle: "lunch")
                        mealViewBuilder(menuInt: 4, menuTitle: "dinner")
                        mealViewBuilder(menuInt: 5, menuTitle: "onTime")
                    }
                }
                Spacer()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.backgroundColor)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func settingTitleViewBuilder(settingTitle: String ) -> some View {
        RoundedRectangle(cornerRadius: 50)
            .foregroundColor(Color.foregroundColor)
            .frame(width: 100, height: 50)
            .overlay(
                Text(settingTitle)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            )
    }
    
    func restaurantViewBuilder(restaurantInt: Int, restaurantTitle: String) -> some View {
        RoundedRectangle(cornerRadius: 50)
            .foregroundColor(self.selectedRestaurant == restaurantInt ? .pointRed : .white)
            .frame(width: 165, height: 50)
            .overlay(
                Text(restaurantTitle)
                    .foregroundColor(self.selectedRestaurant == restaurantInt ? .white : Color.foregroundColor)
                    .fontWeight(self.selectedRestaurant == restaurantInt ? .semibold : .regular)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.poinrtLightGray, lineWidth: 1)
            )
            .onTapGesture {
                self.selectedRestaurant = restaurantInt
                updateSelectedRestaurant(restaurant: restaurantInt)
            }
    }
    
    func mealViewBuilder(menuInt: Int, menuTitle: String) -> some View {
        RoundedRectangle(cornerRadius: 50)
            .foregroundColor(self.selectedMenu == menuInt ? .pointRed : .white)
            .frame(width: 165, height: 50)
            .overlay(
                Text(mealNameDict[menuTitle]!)
                    .foregroundColor(self.selectedMenu == menuInt ? .white : Color.foregroundColor)
                    .fontWeight(self.selectedMenu == menuInt ? .semibold : .regular)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.poinrtLightGray, lineWidth: 1)
            )
            .onTapGesture {
                self.selectedMenu = menuInt
                updateSelectedWidget(meal: menuTitle)
            }
    }
   

}

fileprivate func updateSelectedWidget(meal: String) {
    UserDefaults(suiteName: "group.com.lee.gismeal")?.set(meal, forKey: "widget")
    WidgetCenter.shared.reloadTimelines(ofKind: "junghwan")
}

fileprivate func updateSelectedRestaurant(restaurant: Int) {
    UserDefaults(suiteName: "group.com.lee.gismeal")?.set(restaurant, forKey: "restaurant")
    WidgetCenter.shared.reloadTimelines(ofKind: "junghwan")
}
