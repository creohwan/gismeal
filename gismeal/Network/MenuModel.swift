//
//  Model.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import Foundation
import SwiftUI

struct MenuForm: Codable {
    var breakfast: String
    var lunch: String
    var lunch_corner: String
    var lunch_corner_2 : String
    var dinner: String
    
    enum CodingKeys: String, CodingKey {
        case breakfast
        case lunch
        case lunch_corner
        case lunch_corner_2 = "lunch_bldg1_2"
        case dinner
    }

    func setupParsing(of string: String) -> [String] {
        var returnedArray: [String] = []
        
        let menus = string.split(separator: "\n")
        
        for menu in menus {
            if let endIndex = menu.firstIndex(of: "(") {
                let fixedText = menu[menu.startIndex..<endIndex]
                returnedArray.append(String(fixedText))
            } else if let endIndex = menu.firstIndex(of: "[") {
                let fixedText = menu[menu.startIndex..<endIndex]
                returnedArray.append(String(fixedText))
            } else {
                returnedArray.append(String(menu))
            }
        }
        return returnedArray
    }
    
    func parsingBreakfast() -> [String] {
        return setupParsing(of: breakfast)
    }
    func parsingLunch() -> [String] {
        return setupParsing(of: lunch)
    }
    func parsingLunchCorner() -> [String] {
        return setupParsing(of: lunch_corner)
    }
    func parsingLunchCorner2() -> [String] {
        return setupParsing(of: lunch_corner_2)
    }
    func parsingDinner() -> [String] {
        return setupParsing(of: dinner)
    }
    
    func setupOneSentence(of array: [String]) -> String {
        var newSentence = ""
       
        for string in array {
            newSentence += string
            newSentence += "\n"
        }
        
        return String(newSentence.dropLast(1))
    }
    
    func oneBreakfast() -> String {
        return setupOneSentence(of: parsingBreakfast())
    }
    func oneLunch() -> String {
        return setupOneSentence(of: parsingLunch())
    }
    func oneLunchCorner() -> String {
        return setupOneSentence(of: parsingLunchCorner())
    }
    func oneLunchCorner2() -> String {
        return setupOneSentence(of: parsingLunchCorner2())
    }
    func oneDinner() -> String {
        return setupOneSentence(of: parsingDinner())
    }
    
    mutating func setupAllMenu() {
        self.breakfast = oneBreakfast()
        self.lunch = oneLunch()
        self.lunch_corner = oneLunchCorner()
        self.lunch_corner_2 = oneLunchCorner2()
        self.dinner = oneDinner()
    }
    
    func returnBool() -> [Bool] {
        var check: [Bool] = [true, true, true, true, true]
        check[0] = self.breakfast.isEmpty ? false : true
        check[1] = self.lunch_corner.isEmpty ? false : true
        check[2] = self.lunch.isEmpty ? false : true
        check[3] = self.lunch_corner_2.isEmpty ? false : true
        check[4] = self.dinner.isEmpty ? false : true
        return check
    }
}
