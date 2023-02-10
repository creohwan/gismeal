//
//  HeadView.swift
//  gismeal
//
//  Created by creohwan on 2023/02/09.
//

import SwiftUI

struct HeadView: View {
    @Binding var selectedRestaurant: Int
    
    func setRestaurantTitle() -> String {
        switch selectedRestaurant {
        case 0:
            return "1학생식당"
        case 1:
            return "2학생식당"
        default:
            return "1학생식당"
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.pointRed)
                .overlay(
                    Text("\(setRestaurantTitle())")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                )
//             Text("\(setRestaurantTitle())")
//                 .font(.title2)
//                 .fontWeight(.bold)
//                 .foregroundColor(.black)
//                 .background(Capsule().strokeBorder(Color.pointRed))
        }
        .frame(width: 120, height: 40)
        .padding(.top, 8)
    }
}

