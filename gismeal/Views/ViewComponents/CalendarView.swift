//
//  CalendarView.swift
//  gismeal
//
//  Created by creohwan on 2023/02/09.
//

import SwiftUI

struct CalendarView: View {

    func getDateRange() -> [Date] {
        var dateRange: [Date] = []
        for addDate in 0 ..< 5 {
            dateRange.append(Calendar.current.date(byAdding: .day, value: addDate, to: Date()) ?? Date())
        }
        return dateRange
    }
    
    @Binding var selectedDate: Date
    
    var body: some View {
        HStack(alignment: .center, spacing: .zero) {
            Rectangle()
                .cornerRadius(20)
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                .overlay(
                    HStack {
                        Spacer().frame(width: 30)
                        ForEach(getDateRange(), id: \.self) { date in
                            Button {
                                selectedDate = date
                            } label: {
                                VStack(spacing: 4) {
                                    Text("\(date.getDay())")
                                        .font(.system(size: 14))
                                        .fontWeight(date.getDate() == Date().getDate() ? .bold : .regular)
                                        .foregroundColor(date.getDate() == Date().getDate() ? .pointRed : .foregroundColor)
                                    Text("\(date.getDayOfWeekShort())")
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                        .foregroundColor(date.getDate() == Date().getDate() ? .pointRed : .foregroundColor)
                                }
                                .padding(8)
                                .background(date.getDate() == selectedDate.getDate() ? Color.poinrtLightGray : .clear)
                                .cornerRadius(30)
                            }
                        }.frame(maxWidth: (.infinity - 46) / 7)
                        Spacer().frame(width: 30)
                    }.padding(.bottom, 25)
                )
        }
    }
}
