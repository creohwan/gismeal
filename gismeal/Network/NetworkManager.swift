//
//  NetworkManager.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var R1Day1Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var R1Day2Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var R1Day3Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var R1Day4Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var R1Day5Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    
    @Published var R2Day1Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var R2Day2Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var R2Day3Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var R2Day4Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var R2Day5Menus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")

    var breakfast: String = ""
    var lunch: String = ""
    var lunch_corner: String = ""
    var dinner: String = ""
    
    static let shared = NetworkManager()
    
    func getMenus(by language: Bool) -> Void {
        getMenu(restaurant: 1, dayIndex: 0, language: language)
        getMenu(restaurant: 1, dayIndex: 1, language: language)
        getMenu(restaurant: 1, dayIndex: 2, language: language)
        getMenu(restaurant: 1, dayIndex: 3, language: language)
        getMenu(restaurant: 1, dayIndex: 4, language: language)
        
        getMenu(restaurant: 2, dayIndex: 0, language: language)
        getMenu(restaurant: 2, dayIndex: 1, language: language)
        getMenu(restaurant: 2, dayIndex: 2, language: language)
        getMenu(restaurant: 2, dayIndex: 3, language: language)
        getMenu(restaurant: 2, dayIndex: 4, language: language)
    }
    
    func getMenu(restaurant: Int, dayIndex: Int, language: Bool? = true) -> Void {
        let calendar = Calendar.current
        let today = Date()
        let selectedDay = calendar.date(byAdding: .day, value: dayIndex, to: today)!
        
        let year = calendar.component(.year, from: selectedDay)
        let month = calendar.component(.month, from: selectedDay)
        let day = calendar.component(.day, from: selectedDay)
        let languageInt = language == false ? 1 : 0
        
        //URLRequest
        guard let url = URL(string: "http://52.78.225.99:8080/meals/date/\(year)/\(month)/\(day)/\(restaurant)/\(languageInt)")
        else { fatalError("Missing URL") }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        //URLSession
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if (200..<300) ~= response.statusCode {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        // Decode
                        let decodedMenus = try JSONDecoder().decode(Menu.self, from: data)
                   
                        switch dayIndex {
                        case 0:
                            self.R2Day1Menus = decodedMenus
                            self.saveAtUserDefaults()
                        case 1:
                            self.R2Day2Menus = decodedMenus
                        case 2:
                            self.R2Day3Menus = decodedMenus
                        case 3:
                            self.R2Day4Menus = decodedMenus
                        default:
                            self.R2Day5Menus = decodedMenus
                        }
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else if response.statusCode == 406 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedMenus = try JSONDecoder().decode(NoMenuModel.self, from: data)
                        switch dayIndex {
                        case 0:
                            self.R2Day1Menus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                            self.saveAtUserDefaults()
                        case 1:
                            self.R2Day2Menus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                        case 2:
                            self.R2Day3Menus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                        case 3:
                            self.R2Day4Menus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                        default:
                            self.R2Day5Menus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                        }
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    // save data
    func saveAtUserDefaults() {
        UserDefaults(suiteName: "group.com.lee.gismeal")!.set(self.R2Day1Menus.oneBreakfast(), forKey: "breakfast")

        UserDefaults(suiteName: "group.com.lee.gismeal")!.set(self.R2Day1Menus.oneLunch(), forKey: "lunch")
 
        UserDefaults(suiteName: "group.com.lee.gismeal")!.set(self.R2Day1Menus.oneLunchCorner(), forKey: "lunch_corner")

        UserDefaults(suiteName: "group.com.lee.gismeal")!.set(self.R2Day1Menus.oneDinner(), forKey: "dinner")
     
    }
    
}
