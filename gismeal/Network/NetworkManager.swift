//
//  NetworkManager.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var firstDayMenus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var secondDayMenus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var thirdDayMenus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var fourthDayMenus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
    @Published var fifthDayMenus: Menu = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")

    var breakfast: String = ""
    var lunch: String = ""
    var lunch_corner: String = ""
    var dinner: String = ""
    
    static let shared = NetworkManager()
    
    
    //GET DATE of TODAY || TOMORROW
    func getDate(of date: String) -> [String:String] {
        
        //Define
        let calendar = Calendar.current
        let first = Date()
        let second = calendar.date(byAdding: .day, value: 1, to: first)!
        let third = calendar.date(byAdding: .day, value: 2, to: first)!
        let fourth = calendar.date(byAdding: .day, value: 3, to: first)!
        let fifth = calendar.date(byAdding: .day, value: 4, to: first)!
        
        let dateDict: [String:Date] = [
            "first" : first,
            "second" : second,
            "third" : third,
            "fourth" : fourth,
            "fifth" : fifth
        ]
        
        let year = String(calendar.component(.year, from: (dateDict[date])!))
        let month = calendar.component(.month, from: dateDict[date]!)
        let day = calendar.component(.day, from: dateDict[date]!)
        let weekday = String(calendar.component(.weekday, from: dateDict[date]!))

        let dayDict = [
            "1" : "(일)",
            "2" : "(월)",
            "3" : "(화)",
            "4" : "(수)",
            "5" : "(목)",
            "6" : "(금)",
            "7" : "(토)"
        ]
        
        var refinedMonth = String(month)
        var refinedDay = String(day)
        let refinedWeekDay = dayDict[weekday]!
        
        //formatting
        if month < 10 {
            refinedMonth = "0" + String(month)
        }
        
        if day < 10 {
            refinedDay = "0" + String(day)
        }
        
        //Store UserDefault Data
        let result = ["year": year, "month": refinedMonth, "day": refinedDay, "weekday": refinedWeekDay]
        
        if date == "first" {
            UserDefaults(suiteName: "group.com.lee.gismeal")?.set(result, forKey: "CURRENTDATE")
        }

        //Return
        return result
    }
    
    func getMenus(by language: Bool) -> Void {
        getMenu(of: "first", by: language)
        getMenu(of: "second", by: language)
        getMenu(of: "third", by: language)
        getMenu(of: "fourth", by: language)
        getMenu(of: "fifth", by: language)
    }
    
    func getMenu(of date: String, by language: Bool? = true) -> Void {
        
        let returnedDate = getDate(of: date)
        let year = returnedDate["year"]!
        let month = returnedDate["month"]!
        let day = returnedDate["day"]!
        let languageInt = language == false ? 1 : 0

        //URLRequest
        guard let url = URL(string: "http://52.78.225.99:8080/meals/date/\(year)/\(month)/\(day)/2/\(languageInt)")
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
                   
                        switch date {
                        case "first":
                            self.firstDayMenus = decodedMenus
                            self.saveAtUserDefaults()
                        case "second":
                            self.secondDayMenus = decodedMenus
                        case "third":
                            self.thirdDayMenus = decodedMenus
                        case "fourth":
                            self.fourthDayMenus = decodedMenus
                        default:
                            self.fifthDayMenus = decodedMenus
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
                        switch date {
                        case "first":
                            self.firstDayMenus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                            self.saveAtUserDefaults()
                        case "second":
                            self.secondDayMenus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                        case "third":
                            self.thirdDayMenus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                        case "fourth":
                            self.fourthDayMenus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
                        default:
                            self.fifthDayMenus = Menu(breakfast: "", lunch: "", lunch_corner: "", dinner: "")
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
        UserDefaults(suiteName: "group.com.lee.gismeal")!.set(self.firstDayMenus.oneBreakfast(), forKey: "breakfast")

        UserDefaults(suiteName: "group.com.lee.gismeal")!.set(self.firstDayMenus.oneLunch(), forKey: "lunch")
 
        UserDefaults(suiteName: "group.com.lee.gismeal")!.set(self.firstDayMenus.oneLunchCorner(), forKey: "lunch_corner")

        UserDefaults(suiteName: "group.com.lee.gismeal")!.set(self.firstDayMenus.oneDinner(), forKey: "dinner")
     
    }
    
}

