//
//  CardView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/29.
//

import SwiftUI

struct CardView: View {
    
    let mealName: String
    let mealTime: String
    let mealMenu: String
    
    var body: some View {
        
        VStack(spacing: 10) {
            // CARD
            VStack(alignment: .leading) {
                // Title
                HStack {
                    // Name
                    Text(mealName)
                        .bold()
                        .padding(.leading, 10)
                    Spacer()
                    // Time
                    Text(mealTime)
                        .font(.system(size: 12))
                        .foregroundColor(Color.foregroundColor)
                        .padding(.vertical, 3)
                        .padding(.leading, 5)
                        .padding(.trailing, 10)
                }
                // Food
                VStack(alignment: .leading, spacing: 6) {
                    Text(mealMenu).lineSpacing(4)
                }.padding(.leading, 10)
            }
            .frame(width: 300, alignment: .leading)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.poinrtLightGray, lineWidth: 1)
            )
        }
        
    }
}
