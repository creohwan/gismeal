//
//  UserDefaults+.swift
//  gismeal
//
//  Created by creohwan on 2023/01/30.
//

import Foundation

extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.com.lee.gismeal"
        return UserDefaults(suiteName: appGroupId)!
    }
}
