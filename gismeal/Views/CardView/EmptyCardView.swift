//
//  EmptyCardView.swift
//  gismeal
//
//  Created by creohwan on 2023/01/30.
//

import SwiftUI

struct EmptyCardView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("아직 메뉴가 업로드 되지 않았습니다 :(")
            Text("")
            Text("일요일 저녁 이후에 확인해주세요!")
            Spacer()
        }.frame(width: 300, height: UIScreen.main.bounds.height * 0.6)
    }
}
