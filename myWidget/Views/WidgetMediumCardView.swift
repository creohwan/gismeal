//
//  WidgetMediumCardView.swift
//  myWidgetExtension
//
//  Created by creohwan on 2023/01/31.
//

import SwiftUI
import WidgetKit

struct WidgetMediumCardView: View {
    
    @State var first_menu: String = ""
    @State var second_menu: String = ""
    
    var selectedWidget: String?
    var secondSelectedWidget: String?
    var selectedRestaurant: Int?
    
    var mealNameDict = NameManagerKor().mealName

    init(selectedWidget: String?, selectedRestaurant: Int?) {
        self.selectedWidget = selectedWidget
        self.selectedRestaurant = selectedRestaurant
        
        // TODO:- 추후 언어 설정 시 수정해야 함
//        self.mealNameDict = UserDefaults.shared.value(forKey: "LANGUAGE") as! String == "Eng" ? NameManagerEng().mealName : NameManagerKor().mealName
        
        if self.selectedWidget == "breakfast" {
            self.secondSelectedWidget = "lunch_corner"
        } else if self.selectedWidget == "lunch_corner" {
            self.secondSelectedWidget = "lunch"
        } else if self.selectedWidget == "lunch" {
            self.secondSelectedWidget = "lunch_corner"
        } else if self.selectedWidget == "dinner" {
            self.secondSelectedWidget = "dinner"
            self.selectedWidget = "lunch"
        } else {
            self.secondSelectedWidget = self.selectedWidget
        }
    }
    
    var body: some View {
        HStack{
            WidgetSmallCardView(selectedWidget: self.selectedWidget, selectedRestaurant: self.selectedRestaurant)
            Divider()
                .padding(.vertical)
            WidgetSmallCardView(selectedWidget: self.secondSelectedWidget, selectedRestaurant: self.selectedRestaurant)
        }
    }
}

