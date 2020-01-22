//
//  ViewController.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 21/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import UIKit
import CoreData

class RecipeViewController: UITableViewController {

    @IBOutlet var recipeTableView: UITableView!
//    @IBOutlet weak var recipeTitle: UILabel!
//    @IBOutlet weak var recipeImage: UIImageView!
//    @IBOutlet weak var recipeIngredients: UILabel!
//    @IBOutlet weak var recipeMethods: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var itemArray = [Recipe]()
    
    //MARK - Method add new recipe
    @IBAction func addNewRecipe(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new recipe", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add recipe", style: .default) { (action) in
            
            let newRecipe = Recipe(context: self.context)
            newRecipe.title = textField.text!
            
            self.itemArray.append(newRecipe)
            self.tableView.reloadData()
            
            self.saveRecipe()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Recipe Title"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK - check path for table
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
       // recipeTableView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCustomCell")
        
        loadRecipe()
    }

    //MARK : Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeListCell", for: indexPath)
        
        let recipe =  itemArray[indexPath.row]
       //cell.recipeTitle.text? = recipe.title
        cell.textLabel?.text = recipe.title
        
        return cell
    }
    
    //MARK - Data manipuation
    
    func saveRecipe() {
        do {
            try context.save()
        }catch{
            print("Print context saving Eror : \(error)")
        }
        
        self.tableView.reloadData()
    }

    func loadRecipe() {
        let request : NSFetchRequest<Recipe> = Recipe.fetchRequest()
        do {
            itemArray = try context.fetch(request)
            print("This is the --> \(itemArray)")
        } catch {
            print("Error fetch data : \(error)")
        }
    }
}

