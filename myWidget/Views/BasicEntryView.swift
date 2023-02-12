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
    
    let currentHour = Calendar.current.component(.hour, from: Date())
    
    var selectedRestaurant = UserDefaults.shared.value(forKey: "restaurant") as? Int
    var selectedWidget = UserDefaults.shared.value(forKey: "widget") as? String

    @ViewBuilder
    var body: some View {
        let selectedWidget = selectedWidget == "onTime" ? returnMealOnTime() : selectedWidget
        
        switch family{
        case .systemSmall:
            WidgetSmallCardView(selectedWidget: selectedWidget, selectedRestaurant: selectedRestaurant)
        default:
            WidgetMediumCardView(selectedWidget: selectedWidget,  selectedRestaurant: selectedRestaurant)
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
    else if 13 <= currenHour && currenHour < 24{
        result = "dinner"
    }
    return result
}
