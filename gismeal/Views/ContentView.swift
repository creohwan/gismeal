//
//  ContentView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    
    // Define
    @Environment(\.scenePhase) var scenePhase
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = true
    @EnvironmentObject var networkManager: NetworkManager

    @State private var showLanguage = false
    @State private var showWidget = false
    
    @State private var selectedPlace = Place.SecondPlace
    @State private var selectedWidget = Widget.onTime
    @State private var selectedLanguage: Bool = false
    
    //enum
    enum Place : Int {
        case firstPlace
        case SecondPlace
    }
    
    enum Widget : Int {
        case Breakfast
        case Lunch_A
        case Lunch_B
        case Dinner
        case onTime
    }
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .gray
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    // body
    var body: some View {
        NavigationView {
            TabView {
                MenuView(dayIndex: 0, date: "first", selectedLanguage: $selectedLanguage)
                MenuView(dayIndex: 1, date: "second", selectedLanguage: $selectedLanguage)
                MenuView(dayIndex: 2, date: "third", selectedLanguage: $selectedLanguage)
                MenuView(dayIndex: 3, date: "fourth", selectedLanguage: $selectedLanguage)
                MenuView(dayIndex: 4, date: "fifth", selectedLanguage: $selectedLanguage)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .background(Color.backgroundColor)
            .toolbar{
                ToolbarItemGroup(placement: ToolbarItemPlacement.bottomBar){
                    Spacer()
                    Button {
                        self.showLanguage = true
                    } label: {
                        Text("Language").foregroundColor(Color.pointBlue)
                    }
                    Spacer()
                    Button {
                        self.showWidget = true
                    } label: {
                        Text("위젯 설정").foregroundColor(Color.pointBlue)
                    }
                    Spacer()
                }
            }
            .confirmationDialog("click language you wnat", isPresented: self.$showLanguage, titleVisibility: .visible) {
                Button("한국어") {
                    self.selectedLanguage.toggle()
                    networkManager.getMenus(by: selectedLanguage)
                }
                Button("English") {
                    self.selectedLanguage.toggle()
                    networkManager.getMenus(by: selectedLanguage)
                }
            }
            .confirmationDialog("위젯에 표시할 정보를 선택해주세요", isPresented: self.$showWidget, titleVisibility: .visible) {
                Button("조식") {
                    self.selectedWidget = Widget.Breakfast
                }
                Button("중식(일반식)") {
                    self.selectedWidget = Widget.Lunch_A
                }
                Button("중식(특식)") {
                    self.selectedWidget = Widget.Lunch_B
                }
                Button("석식") {
                    self.selectedWidget = Widget.Dinner
                }
                Button("시간에 맞추기") {
                    self.selectedWidget = Widget.onTime
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Gismeal")
                        .font(.title2.bold())
                        .foregroundColor(Color.pointBlue)
                        .accessibilityAddTraits(.isHeader)
                }
            }
//            .navigationBarItems(
//                trailing: NavigationLink(destination: SettingView()) {
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
