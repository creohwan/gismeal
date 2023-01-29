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
                .font(.title2)
                .multilineTextAlignment(.center)
            Text(lasttitle)
                .font(.title3)
                .multilineTextAlignment(.center)
        
            Button {
                isFirstLaunching.toggle()
            } label: {
                Text("시작하기")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.pointBlue)
                    .cornerRadius(6)
            }
            .padding()
        }
    }
}
