//
//  OnBoardingBasicView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/27.
//

import SwiftUI

struct OnBoardingBasicView: View {
    
    let imageName: String
    let title: String
    let subtitle: String
    
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
        }.frame(alignment: .center)
    }
}
