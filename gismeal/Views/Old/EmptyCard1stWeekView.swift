//
//  EmptyCard1stWeekView.swift
//  gismeal
//
//  Created by creohwan on 2023/02/11.
//

import SwiftUI

struct EmptyCard1stWeekView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("1학생식당은 평일에만 운영됩니다 :)")
            Spacer()
        }.frame(width: 300, height: UIScreen.main.bounds.height * 0.6)
    }
}
