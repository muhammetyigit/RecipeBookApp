//
//  Food.swift
//  RecipeBook
//
//  Created by Muhammet Yiğit on 7.04.2025.
//

import Foundation

struct Food {
    let symbol: String
    let name: String
    let recipe: String
    let ingredients: String
    let cookingTime: Int
    var bestTime: String {
        return  "min:" + String(cookingTime)
    }
}
