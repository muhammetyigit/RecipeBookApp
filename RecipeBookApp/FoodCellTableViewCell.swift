//
//  FoodCellTableViewCell.swift
//  RecipeBook
//
//  Created by Muhammet Yiğit on 7.04.2025.
//

import UIKit

class FoodCellTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    @IBOutlet var symbol: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    
    // MARK: - Functions
    func update(with food: Food) {
        symbol.text = food.symbol
        name.text = food.name
        time.text = food.bestTime
    }
    
}
