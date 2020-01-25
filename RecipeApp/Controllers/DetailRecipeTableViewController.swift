//
//  DetailRecipeTableViewController.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 23/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import UIKit
import RealmSwift

class DetailRecipeTableViewController: UITableViewController {

    var ingredientsAndMethods  : Results <IngredientsMethods>?
    
    let realm = try! Realm()
    
    struct TableSection {
        var sectionName : String
        var sectionContent : Results<IngredientsMethods>?
    }
    
    var selectedRecipe : Recipe? {
        didSet{
            loadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailRecipe", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsAndMethods?.count ?? 1
    }
    
    
    
    
    //MARK: - Data Manipulation Method
    
    func loadData () {
        ingredientsAndMethods = selectedRecipe?.linkIngredientsMethods.sorted(byKeyPath: "flag", ascending: true)
        
        //recipeList = realm.objects(Recipe.self)
        tableView.reloadData()
    }
    
    //MARK: - Add new Ingredients and Methods
    
    @IBAction func buttonPressAddIngredients(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add the Ingredients", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add ingredient", style: .default) { (action) in
            
            let addIngredient = IngredientsMethods()
            addIngredient.ingredients = textField.text!
            addIngredient.flag = "I"
            do {
                try self.realm.write {
                    self.realm.add(addIngredient)
                }
            }catch {
                print("Error saving data to ingredient : \(error)")
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "1 cup of Milk"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonPressAddMethods(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add the Methods", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add method", style: .default) { (action) in
            
            let addMethod = IngredientsMethods()
            addMethod.method = textField.text!
            addMethod.flag = "M"
            do {
                try self.realm.write {
                    self.realm.add(addMethod)
                }
            }catch {
                print("Error saving data to ingredient : \(error)")
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "1 cup of Milk"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func addIngredientMethods(_ sender: UIBarButtonItem) {
    }
    
    //MARK: - TableView Delegate Methods
    
}
