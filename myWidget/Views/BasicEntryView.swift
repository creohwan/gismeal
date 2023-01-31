//
//  BasicEntryView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/31.
//

import SwiftUI
import WidgetKit

struct myWidgetEntryView : View {
    
    @Environment(\.widgetFamily) var family
    
    var entry: Provider.Entry
    
    let CURRENTDATE = UserDefaults.shared.value(forKey: "CURRENTDATE") as? String
    
    var SELECTEDWIDGET = UserDefaults.shared.value(forKey: "SELECTEDWIDGET") as? String
    
    let currentHour = Calendar.current.component(.hour, from: Date())

    @ViewBuilder
    var body: some View {
        let selectedWidget = SELECTEDWIDGET == "onTime" ? returnMealOnTime() : SELECTEDWIDGET
        
        switch family{
        case .systemSmall:
            WidgetSmallCardView(selectedWidget: selectedWidget)
        default:
            WidgetMediumCardView(selectedWidget: selectedWidget)
        }
    
    }
}

fileprivate func returnMealOnTime() -> String{
    let currenHour = Calendar.current.component(.hour, from: Date())
    var result = ""

    if 0 <= currenHour && currenHour < 9{
        result = "breakfast"
    }
    else if 9 <= currenHour && currenHour < 13 {
        result = "lunch_corner"
    }
    else if 14 <= currenHour && currenHour <= 23{
        result = "dinner"
    }
    return result
}
