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
    
    init(selectedWidget: String?) {
        self.selectedWidget = selectedWidget
        self.scheduleDict = TimeManger().timeMiniSize
        self.mealNameDict = UserDefaults.shared.value(forKey: "LANGUAGE") as! String == "Eng" ? NameManagerEng().mealName : NameManagerKor().mealName
    }
    
    var body: some View {
        VStack(alignment: .leading){
            menuViewBuilder()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 8)
        .padding(.vertical, 10)
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
                        .bold()
                } else if selectedWidget == nil {
                    Text("에러").bold()
                }
            }
            Spacer()
            Text(scheduleDict[selectedWidget ?? "lunch_corner"]!)
                .font(.system(size:12))
                .foregroundColor(Color.timeForegroundColor)
                .padding(.vertical, 3)
                .padding(.horizontal, 10)
                .background(Color.timeBackgroundColor)
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
        
        
        
    }
}
