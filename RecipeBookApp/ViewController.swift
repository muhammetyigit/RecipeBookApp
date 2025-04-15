//
//  ViewController.swift
//  RecipeBook
//
//  Created by Muhammet Yiğit on 7.04.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UI Elements
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    var foods = [
        Food(symbol: "🌮", name: "Taco", recipe: "Cook the meat with taco seasoning, add lettuce, tomato and avocado to a warmed tortilla and serve.", ingredients: "Mexican tortilla, grilled chicken or beef, lettuce, tomato, avocado and taco seasoning.", cookingTime: 20),
        Food(symbol: "🍝", name: "Spagetti", recipe: "Mexican tortilla, grilled chicken or beef, lettuce, tomato, avocado and taco seasoning.", ingredients: "Spaghetti, tomato sauce, olive oil, grated cheese.", cookingTime: 7)
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource & UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipe") as! FoodCellTableViewCell
        cell.update(with: foods[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            foods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "update", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedFood = foods.remove(at: sourceIndexPath.row)
        foods.insert(movedFood, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    // MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "update" else { return }
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        let selectedFood = foods[selectedIndexPath.row]
        
        let navigationController = segue.destination as! UINavigationController
        let newFoodController = navigationController.topViewController as! NewFoodTableViewController
        
        newFoodController.food = selectedFood
    }
    
    // MARK: - Actions
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        if segue.identifier == "cancel" {
            tableView.reloadData()
        }
        
        if segue.identifier == "save" {
            if let sourceController = segue.source as? NewFoodTableViewController, let newFood = sourceController.food {
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    foods[selectedIndexPath.row] = newFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                } else {
                    foods.append(newFood)
                    tableView.reloadData()
                }
            }
        }
    }
    
}

