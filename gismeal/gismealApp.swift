//
//  gismealApp.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import SwiftUI

@main
struct gismealApp: App {
    var networkManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environmentObject(networkManager)
            MainView()
                .environmentObject(networkManager)
            
        }
    }
}
