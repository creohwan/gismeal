//
//  ContentView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    // Define
    @Environment(\.scenePhase) var scenePhase
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = true
    @EnvironmentObject var networkManager: NetworkManager

    @State private var showLanguage = false
    @State private var showWidget = false
    
    @State private var selectedPlace = Place.SecondPlace
    @State private var selectedWidget = Widget.onTime
    @State private var selectedLanguage: Bool = true
    
    @State var selectedRestaurantNum = 0
    @State var selectedDate = Date()
    
    //enum
    enum Place : Int {
        case firstPlace
        case SecondPlace
    }
    
    enum Widget : Int {
        case breakfast
        case lunch
        case lunch_corner
        case dinner
        case onTime
    }
    
//    init() {
//        UIPageControl.appearance().currentPageIndicatorTintColor = .gray
//        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
//    }
    
    // body
    var body: some View {
        NavigationView {
            VStack {
                TabView {
//                    MenuView(dayIndex: 0, date: "first", selectedLanguage: $selectedLanguage)
//                    MenuView(dayIndex: 1, date: "second", selectedLanguage: $selectedLanguage)
//                    MenuView(dayIndex: 2, date: "third", selectedLanguage: $selectedLanguage)
//                    MenuView(dayIndex: 3, date: "fourth", selectedLanguage: $selectedLanguage)
//                    MenuView(dayIndex: 4, date: "fifth", selectedLanguage: $selectedLanguage)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                RestaurantSegmentView(selectedRestaurant: $selectedRestaurantNum)
                    .padding(.bottom, 16)
                CalendarView(selectedDate: $selectedDate)
                    .padding(.bottom, 18)
            }
            .background(Color.backgroundColor)
            .toolbar{
                ToolbarItemGroup(placement: ToolbarItemPlacement.bottomBar){
                    Spacer()
                    Button {
                        self.showLanguage = true
                    } label: {
                        Text("Language").foregroundColor(Color.black)
                    }
                    Spacer()
                    Button {
                        self.showWidget = true
                    } label: {
                        Text("위젯 설정").foregroundColor(Color.black)
                    }
                    Spacer()
                }
            }
            .confirmationDialog("click language you wnat", isPresented: self.$showLanguage, titleVisibility: .visible) {
                Button("한국어") {
                    self.selectedLanguage = true
                    UserDefaults(suiteName: "group.com.lee.gismeal")?.set("Kor", forKey: "LANGUAGE")
                    networkManager.getMenus(by: selectedLanguage)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
                        WidgetCenter.shared.reloadTimelines(ofKind: "junghwan")
                    }
                    
                }
                Button("English") {
                    self.selectedLanguage = false
                    UserDefaults(suiteName: "group.com.lee.gismeal")?.set("Eng", forKey: "LANGUAGE")
                    networkManager.getMenus(by: selectedLanguage)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
                        WidgetCenter.shared.reloadTimelines(ofKind: "junghwan")
                    }
                }
            }
            .confirmationDialog("위젯에 표시할 정보를 선택해주세요", isPresented: self.$showWidget, titleVisibility: .visible) {
                Button("오늘 아침") {
                    self.selectedWidget = Widget.breakfast
                    updateSelectedWidget(meal: "breakfast")
                }
                Button("오늘 점심(코너)") {
                    self.selectedWidget = Widget.lunch_corner
                    updateSelectedWidget(meal: "lunch_corner")
                }
                Button("오늘 점심(일반)") {
                    self.selectedWidget = Widget.lunch
                    updateSelectedWidget(meal: "lunch")
                }
                Button("오늘 저녁") {
                    self.selectedWidget = Widget.dinner
                    updateSelectedWidget(meal: "dinner")
                }
                Button("시간에 맞추기") {
                    self.selectedWidget = Widget.onTime
                    updateSelectedWidget(meal: "onTime")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("밥 in GIST")
                        .font(.title2.bold())
                        .foregroundColor(Color.pointRed)
                        .accessibilityAddTraits(.isHeader)
                }
            }
//            .navigationBarItems(
//                trailing: NavigationLink(destination: DeveloperView()) {
//                    Image(systemName: "gearshape").resizable()
//                        .foregroundColor(Color.pointBlue)
//                }
//            )
        }
        .onChange(of: scenePhase) {
            newPhase in
            if newPhase == .active {
                networkManager.getMenus(by: selectedLanguage)
            }
        }
        .onAppear {
            networkManager.getMenus(by: selectedLanguage)
        }
        .fullScreenCover(isPresented: self.$isFirstLaunching){
            OnBoardingTabView(isFirstLaunching: self.$isFirstLaunching)
                .background(Color.backgroundColor)
        }
    }
}

fileprivate func updateSelectedWidget(meal: String) {
    UserDefaults(suiteName: "group.com.lee.gismeal")?.set(meal, forKey: "SELECTEDWIDGET")
    WidgetCenter.shared.reloadTimelines(ofKind: "junghwan")
}
