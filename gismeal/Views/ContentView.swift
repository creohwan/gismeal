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
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = true
    @Environment(\.scenePhase) var scenePhase
    @EnvironmentObject var networkManager: NetworkManager
    
    @State private var selectedLanguage: Bool = true
    @State var selectedRestaurant = 1
    @State var selectedDate = Date()
    @State var selectedMenu: Int = 5
    
    init(){
       UIPageControl.appearance().currentPageIndicatorTintColor = .black
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
     }

    // body
    var body: some View {
        NavigationView {
            VStack {
                RestaurantSegmentView(selectedRestaurant: $selectedRestaurant)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                
                TabView (selection: $selectedRestaurant) {
                    MenuView(selectedDate: $selectedDate, selectedRestaurant: 1).tag(0)
                    MenuView(selectedDate: $selectedDate, selectedRestaurant: 2).tag(1)
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
                trailing: NavigationLink(destination: WidgetSettingView(selectedRestaurant: $selectedRestaurant, selectedMenu: $selectedMenu)) {
                    Image(systemName: "gearshape").resizable()
                        .foregroundColor(Color.pointBlue)
                }
            )
        }
        .onChange(of: scenePhase){
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
