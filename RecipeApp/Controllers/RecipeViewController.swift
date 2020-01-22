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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var itemArray = ["cake", "mee", "mushroom soup"]
    
    //MARK - Method add new recipe
    @IBAction func addNewRecipe(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new recipe", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add recipe", style: .default) { (action) in
            
            let newRecipe = Recipe(context: self.context)
            
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
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
        recipeTableView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCustomCell")
        
        
    }

    //MARK : Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCustomCell", for: indexPath) as! CustomCellTableViewCell
        
        cell.recipeTitle.text = itemArray[indexPath.row]
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

}

