//
//  WidgetSettingView.swift
//  gismeal
//
//  Created by creohwan on 2023/02/11.
//

import SwiftUI
import WidgetKit

struct WidgetSettingView: View {
    
    @State var selectedRestaurant: Int = 1
    @State var selectedMenu: Int = 5
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("위젯에 보일 내용을 선택하세요")
                    .font(.title2)
                
                Spacer().frame(height: 30)
                
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.foregroundColor)
                        .frame(width: 100, height: 50)
                        .overlay(
                            Text("식당 설정")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        )
                    
                    Spacer().frame(width: 30)
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(self.selectedRestaurant == 1 ? .pointRed : .white)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("1학생식당")
                                    .foregroundColor(self.selectedRestaurant == 1 ? .white : Color.foregroundColor)
                                    .fontWeight(self.selectedRestaurant == 1 ? .semibold : .regular)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.poinrtLightGray, lineWidth: 1)
                            )
                            .onTapGesture {
                                self.selectedRestaurant = 1
                                updateSelectedRestaurant(restaurant: 1)
                            }
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(self.selectedRestaurant == 2 ? .pointRed : .white)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("2학생식당")
                                    .foregroundColor(self.selectedRestaurant == 2 ? .white : Color.foregroundColor)
                                    .fontWeight(self.selectedRestaurant == 2 ? .semibold : .regular)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.poinrtLightGray, lineWidth: 1)
                            )
                            .onTapGesture {
                                self.selectedRestaurant = 2
                                updateSelectedRestaurant(restaurant: 2)
                            }
                    }
                }
                
                Spacer().frame(height: 50)
                
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.foregroundColor)
                        .frame(width: 100, height: 50)
                        .overlay(
                            Text("메뉴 설정")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        )
                    
                    Spacer().frame(width: 30)
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(self.selectedMenu == 1 ? .pointRed : .white)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("오늘 점심(일반)")
                                    .foregroundColor(self.selectedMenu == 1 ? .white : Color.foregroundColor)
                                    .fontWeight(self.selectedMenu == 1 ? .semibold : .regular)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.poinrtLightGray, lineWidth: 1)
                            )
                            .onTapGesture {
                                self.selectedMenu = 1
                                updateSelectedWidget(meal: "breakfast")
                            }
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(self.selectedMenu == 2 ? .pointRed : .white)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("오늘 점심(일반)")
                                    .foregroundColor(self.selectedMenu == 2 ? .white : Color.foregroundColor)
                                    .fontWeight(self.selectedMenu == 2 ? .semibold : .regular)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.poinrtLightGray, lineWidth: 1)
                            )
                            .onTapGesture {
                                self.selectedMenu = 2
                                updateSelectedWidget(meal: "lunch")
                            }
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(self.selectedMenu == 3 ? .pointRed : .white)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("오늘 점심(코너)")
                                    .foregroundColor(self.selectedMenu == 3 ? .white : Color.foregroundColor)
                                    .fontWeight(self.selectedMenu == 3 ? .semibold : .regular)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.poinrtLightGray, lineWidth: 1)
                            )
                            .onTapGesture {
                                self.selectedMenu = 3
                                updateSelectedWidget(meal: "lunch_corner")
                            }
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(self.selectedMenu == 4 ? .pointRed : .white)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("오늘 저녁")
                                    .foregroundColor(self.selectedMenu == 4 ? .white : Color.foregroundColor)
                                    .fontWeight(self.selectedMenu == 4 ? .semibold : .regular)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.poinrtLightGray, lineWidth: 1)
                            )
                            .onTapGesture {
                                self.selectedMenu = 4
                                updateSelectedWidget(meal: "dinner")
                            }
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(self.selectedMenu == 5 ? .pointRed : .white)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("시간에 맞추기")
                                    .foregroundColor(self.selectedMenu == 5 ? .white : Color.foregroundColor)
                                    .fontWeight(self.selectedMenu == 5 ? .semibold : .regular)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.poinrtLightGray, lineWidth: 1)
                            )
                            .onTapGesture {
                                self.selectedMenu = 5
                                updateSelectedWidget(meal: "onTime")
                            }
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.backgroundColor)
            .navigationBarBackButtonHidden(true)
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

struct WidgetSettingView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetSettingView()
    }
}
