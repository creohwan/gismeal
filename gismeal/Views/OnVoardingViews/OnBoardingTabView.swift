//
//  OnBoardingTabView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/27.
//

import SwiftUI

struct OnBoardingTabView: View {
    
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        TabView{
            OnBoardingBasicView(
                imageName: "arrow.left.arrow.right",
                title: "넘기기",
                subtitle: "총 5일치의 메뉴를 보여드립니다. \n 페이지를 넘겨서 확인하세요."
            )
            OnBoardingBasicView(
                imageName: "iphone.homebutton",
                title: "위젯",
                subtitle: "앱에 들어오지 않고도\n식당 메뉴를 확인 하실수 있습니다."
            )
            OnBoardingLastPageView(
                imageName: "gear",
                title: "위젯 설정",
                subtitle: "하단 \"위젯 설정\"을 눌러서\n위젯에 표시할 내용을 선택하세요.",
                lasttitle: "",
                isFirstLaunching: $isFirstLaunching
            )
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onAppear {
            upadateSetting()
        }
    }
    
    private func upadateSetting() {
        UserDefaults(suiteName: "group.com.lee.gismeal")?.set("Kor", forKey: "LANGUAGE")
        UserDefaults(suiteName: "group.com.lee.gismeal")?.set("onTime", forKey: "SELECTEDWIDGET")
    }
}
