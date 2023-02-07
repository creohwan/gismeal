//
//  WidgetSmallCardView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/31.
//

import SwiftUI
import WidgetKit

struct WidgetSmallCardView: View {
    
    //Define
    @State var menu: String = ""
    
    let selectedWidget: String?
    
    var scheduleDict = TimeManger().timeMiniSize
    var mealNameDict = NameManagerKor().mealName
    // TODO: - 추후 학생식당 추가시 수정 필요함
    var selectedPlace: Int = 2
    var selectedPlaceName: String = "2학"
    
    init(selectedWidget: String?) {
        self.selectedWidget = selectedWidget
        self.scheduleDict = TimeManger().timeMiniSize
        self.mealNameDict = UserDefaults.shared.value(forKey: "LANGUAGE") as! String == "Eng" ? NameManagerEng().widgetMealName : NameManagerKor().widgetMealName
        // TODO: - 추후 학생식당 추가시 수정 필요함
        self.selectedPlaceName = selectedPlace == 2 ? " 2학 " : " 1학 "
    }
    
    var body: some View {
        VStack(alignment: .leading){
            menuViewBuilder()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 12)
        .padding(.top, 14)
        .padding(.bottom, 4)
        .background(Color.white)
        .onAppear{
            self.menu = ""
            guard let menu = UserDefaults.shared.value(forKey: self.selectedWidget!) as? String
            else { return }
            self.menu = menu
        }
    }
    
    @ViewBuilder func menuViewBuilder() -> some View {
        HStack {
            Group {
                if selectedWidget != nil {
                    Text("\(mealNameDict[selectedWidget!]!)")
                        .font(.system(size: 14))
                        .bold()
                } else if selectedWidget == nil {
                    Text("에러").bold()
                }
            }
            Spacer()
//            Text(scheduleDict[selectedWidget ?? "lunch_corner"]!)
            // TODO: - 추후 학생식당 선택시 로직 필요함
            Text(selectedPlaceName)
                .font(.system(size:12))
                .foregroundColor(Color.black)
                .padding(.vertical, 3)
                .padding(.horizontal, 7)
                .background(Color.backgroundColor)
                .cornerRadius(10)
        }
        VStack(alignment: .leading, spacing: 2){
            if menu != "" {
                Text(menu)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
            } else {
                Text("위젯 제거 후 다시 추가해주세요")
            }
        }
        Spacer()
    }
}
