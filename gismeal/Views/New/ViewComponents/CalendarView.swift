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
                    ForEach(getDateRange(), id: \.self) { date in
                        Button {
                            selectedDate = date
                        } label: {
                            VStack(spacing: 4) {
                                Text("\(date.getDay())")
                                    .font(.system(size: 14))
                                    .fontWeight(date.getDate() == Date().getDate() ? .bold : .semibold)
                                    .foregroundColor(date.getDate() == Date().getDate() ? .pointRed : .black)
                                Text("\(date.getDayOfWeekShort())")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(date.getDate() == Date().getDate() ? .pointRed : .black)
                            }
                            .padding(8)
                            .background(Capsule().strokeBorder(date.getDate() == selectedDate.getDate() ? Color.pointRed : .clear))
                        }
                    }
                    .frame(maxWidth: (.infinity - 46) / 7)
        }
    }
}
