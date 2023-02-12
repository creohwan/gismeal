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
    var selectedRestaurant: Int?
    
    var mealNameDict = NameManagerKor().mealName
    
    init(selectedWidget: String?, selectedRestaurant: Int?) {
        self.selectedWidget = selectedWidget
        self.selectedRestaurant = selectedRestaurant
        
        if self.selectedWidget == "lunch_corner" {
            let newSelectedWidget = checkLunchCorner(menu: self.selectedWidget!)
            self.selectedWidget = newSelectedWidget
        }
        
        // TODO:- 추후 언어 설정 시 수정해야 함
//        self.mealNameDict = UserDefaults.shared.value(forKey: "LANGUAGE") as! String == "Eng" ? NameManagerEng().widgetMealName : NameManagerKor().widgetMealName
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
            
            let today = Date()
            if (today.getDayOfWeekShort() == "토" || today.getDayOfWeekShort() == "일") && selectedRestaurant == 1 {
                self.menu = "1학생식당은 평일에만 운영됩니다"
            } else {
                guard let menu = UserDefaults.shared.value(forKey: "\(self.selectedRestaurant!)\(self.selectedWidget!)") as? String
                else { return }
                self.menu = menu
            }
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
            Text(self.selectedRestaurant == 1 ? " 1학 " : " 2학 ")
                .font(.system(size:12))
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .padding(.vertical, 3)
                .padding(.horizontal, 10)
                .background(Color.pointRed)
                .cornerRadius(10)
        }.padding(.bottom, 2)
        VStack(alignment: .leading, spacing: 2){
            if menu != "" {
                Text(menu)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
            } else {
                Text("앱 우측 상단 설정에서\n위젯 재설정 후\n위젯 재설치 해주세요.")
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
