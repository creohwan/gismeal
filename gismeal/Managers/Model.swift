//
//  Model.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import Foundation

struct Menu: Identifiable, Codable{
    var id: Int
    var date: Int
    var type: String
    var foods: [Foods]
    var kcal: Int
    var protein: Int
    
    struct Foods: Identifiable, Codable{
        var id: Int
        var name_kor: String
        var name_eng: String
        var isVegan: Bool
        var isMain: Bool
    }
}

