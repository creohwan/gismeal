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
                imageName: "fork.knife",
                title: "식당 설정",
                subtitle: "하단 \"식당 설정\"을 눌러서\n원하는 식당을 선택하세요. "
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
                lasttitle: "\n+ 위젯 설정 변경시 \n위젯을 지웠다 다시 추가해주세요.",
                isFirstLaunching: $isFirstLaunching
            )
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
