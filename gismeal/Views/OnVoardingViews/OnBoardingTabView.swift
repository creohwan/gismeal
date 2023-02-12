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
                subtitle: "1학생식당과 2학생식당\n2개의 식단표를 제공합니다.\n좌우로 넘기며 확인하세요."
            )
            OnBoardingBasicView(
                imageName: "calendar",
                title: "날짜 선택",
                subtitle: "총 5일치의 메뉴를 보여드립니다.\n하단의 날짜를 선택해서 확인하세요."
            )
            OnBoardingLastPageView(
                imageName: "iphone.homebutton",
                title: "위젯",
                subtitle: "상단 \"설정\"을 눌러서\n위젯에 표시할 내용을 선택하세요.",
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
