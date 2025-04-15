//
//  NewFoodTableViewController.swift
//  RecipeBook
//
//  Created by Muhammet Yiğit on 7.04.2025.
//

import UIKit

class NewFoodTableViewController: UITableViewController {
    
    // MARK: - UI Elements
    @IBOutlet var symbolTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var recipeTextField: UITextField!
    @IBOutlet var ingredientsTextField: UITextField!
    @IBOutlet var cookingTimeTextField: UITextField!
    
    // MARK: - Properties
    var food: Food?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let food = food {
            symbolTextField.text = food.symbol
            nameTextField.text = food.name
            recipeTextField.text = food.recipe
            ingredientsTextField.text = food.ingredients
            cookingTimeTextField.text = String(food.cookingTime)
        }
    }
    
    // MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let symbol = symbolTextField.text,
           let name = nameTextField.text,
           let recipe = recipeTextField.text,
           let ingredients = ingredientsTextField.text,
           let cookingTime = cookingTimeTextField.text {
            food = Food(symbol: symbol, name: name, recipe: recipe, ingredients: ingredients, cookingTime: Int(cookingTime) ?? 0)
        }
    }
    
}
