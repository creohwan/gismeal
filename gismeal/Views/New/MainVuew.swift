//
//  MainVuew.swift
//  gismeal
//
//  Created by creohwan on 2023/02/09.
//


import SwiftUI
import WidgetKit

struct MainView: View {
    
    // Define
    @Environment(\.scenePhase) var scenePhase
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = true
    @EnvironmentObject var networkManager: NetworkManager
    
    @State private var selectedLanguage: Bool = true
    @State var selectedRestaurant = 0
    @State var selectedDate = Date()

    // body
    var body: some View {
        NavigationView {
            VStack {
                RestaurantSegmentView(selectedRestaurant: $selectedRestaurant)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                
                TabView (selection: $selectedRestaurant) {
                    MealView(selectedDate: $selectedDate, selectedRestaurant: 1).tag(0)
                    MealView(selectedDate: $selectedDate, selectedRestaurant: 2).tag(1)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }.overlay(
                CalendarView(selectedDate: $selectedDate), alignment: .bottom
            )
            .ignoresSafeArea(edges: .bottom)
            .frame(maxHeight: .infinity)
            .background(Color.backgroundColor)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Spacer()
                        Text("\(selectedDate.getMonthAndDayKor()) (\(selectedDate.getDayOfWeekShort()))")
                            .font(.title2.bold())
                            .foregroundColor(.black)
                            .accessibilityAddTraits(.isHeader)
                    }
                }
            }
            .navigationBarItems(
                trailing: NavigationLink(destination: ContentView()) {
                    Image(systemName: "gearshape").resizable()
                        .foregroundColor(Color.pointBlue)
                }
            )
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
