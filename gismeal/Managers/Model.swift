//
//  Model.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import Foundation

struct Menu: Codable, Identifiable {
    var id: Int?
    var breakfast: String
    var lunch: String
    var lunch_corner: String
    var dinner: String
}

