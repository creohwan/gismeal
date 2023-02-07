//
//  Model.swift
//  gismeal
//
//  Created by creohwan on 2023/01/26.
//

import Foundation
import SwiftUI

struct Menu: Codable {
    var breakfast: String
    var lunch: String
    var lunch_corner: String
    var dinner: String

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
    func oneDinner() -> String {
        return setupOneSentence(of: parsingDinner())
    }
    
    mutating func setupAllMenu() {
        breakfast = oneBreakfast()
        lunch_corner = oneLunchCorner()
        lunch = oneLunch()
        dinner = oneDinner()
    }
}
