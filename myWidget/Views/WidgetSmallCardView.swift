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
    
    var selectedWidget: String?
    
    var scheduleDict = TimeManger().timeMiniSize
    var mealNameDict = NameManagerKor().mealName
    // TODO: - 추후 학생식당 추가시 수정 필요함
    var selectedPlace: Int = 2
    var selectedPlaceName: String = "2학"
    
    init(selectedWidget: String?) {
        self.selectedWidget = selectedWidget
        if self.selectedWidget == "lunch_corner" {
            let newSelectedWidget = checkLunchCorner(menu: self.selectedWidget!)
            self.selectedWidget = newSelectedWidget
        }
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
        .padding(.horizontal, 14)
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
                        .font(.system(size: 15))
                        .foregroundColor(Color.black)
                        .bold()
                        .multilineTextAlignment(.center)
                } else if selectedWidget == nil {
                    Text("에러").bold()
                }
            }
            Spacer()
//            Text(scheduleDict[selectedWidget ?? "lunch_corner"]!)
            // TODO: - 추후 학생식당 선택시 로직 필요함
            Text(selectedPlaceName)
                .font(.system(size:12))
                .foregroundColor(Color.white)
                .padding(.vertical, 3)
                .padding(.horizontal, 10)
                .background(Color.pointRed)
                .bold()
                .cornerRadius(10)
        }.padding(.bottom, 2)
        VStack(alignment: .leading, spacing: 2){
            if menu != "" {
                Text(menu)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
            } else {
                Text("위젯 재설정 이후,\n위젯을 다시 추가해주세요")
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
            }
        }
        Spacer()
    }
    
    func checkLunchCorner(menu: String) -> String {
        guard let lunchCornerMenu = UserDefaults.shared.value(forKey: self.selectedWidget!) as? String
        else { return "lunch" }
            
        if lunchCornerMenu == "\n" || lunchCornerMenu == ""  {
            return "lunch"
        } else {
            return "lunch_corner"
        }
    }
}
