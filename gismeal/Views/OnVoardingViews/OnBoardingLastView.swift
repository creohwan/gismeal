//
//  OnBoardingLastView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/27.
//

import SwiftUI

struct OnBoardingLastPageView: View {
    let imageName: String
    let title: String
    let subtitle: String
    let lasttitle: String
    
        @Binding var isFirstLaunching: Bool
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 100))
                .padding()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(subtitle)
                .font(.title3)
                .multilineTextAlignment(.center)
            Text(lasttitle)
                .font(.title3)
                .multilineTextAlignment(.center)
        
            Button {
                upadateSetting()
                isFirstLaunching.toggle()
            } label: {
                Text("시작하기")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.pointRed)
                    .cornerRadius(6)
            }
            .padding()
        }
    }
    
    private func upadateSetting() {
        UserDefaults(suiteName: "group.com.lee.gismeal")?.set("Kor", forKey: "LANGUAGE")
        UserDefaults(suiteName: "group.com.lee.gismeal")?.set("onTime", forKey: "widget")
        UserDefaults(suiteName: "group.com.lee.gismeal")?.set(1, forKey: "restaurant")
    }
}
