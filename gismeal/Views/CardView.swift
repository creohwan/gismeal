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
                    Spacer()
                    // Time
                    Text(mealTime)
                        .font(.system(size: 12))
                        .foregroundColor(Color.black)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 5)
                        .background(Color.backgroundColor)
                        .cornerRadius(12)
                }
                // Food
                VStack(alignment: .leading, spacing: 6) {
                    Text(mealMenu)
                }
            }
            .frame(width: 290, alignment: .leading)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
        
    }
}
