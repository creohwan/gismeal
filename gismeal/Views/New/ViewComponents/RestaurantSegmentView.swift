//
//  RestaurantSegmentView.swift
//  gismeal
//
//  Created by creohwan on 2023/02/09.
//

import SwiftUI

struct RestaurantSegmentView: View {
    @Binding var selectedRestaurant: Int
    let pickerIndex: [String] = ["1학생식당","2학생식당"]
    
    var body: some View {
        HStack(spacing: .zero) {
            ForEach(pickerIndex.indices, id:\.self) { restaurantNum in
                ZStack {
                    Rectangle()
                        .fill(Color(UIColor.lightGray))
                    
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.pointRed)
                        .opacity(selectedRestaurant == restaurantNum ? 1 : 0.00001)
                        .onTapGesture {
                            selectedRestaurant = restaurantNum
                        }
                }
                .overlay(
                    Text(pickerIndex[restaurantNum])
                        .font(.system(size: 18))
                        .fontWeight(selectedRestaurant == restaurantNum ? .bold : .medium)
                        .foregroundColor(selectedRestaurant == restaurantNum ? .white : .foregroundColor)
                )
            }
        }
        .frame(width: 280, height: 40)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.3), radius: 2)
    }
}

