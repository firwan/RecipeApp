//
//  ViewController.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 21/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import UIKit
import RealmSwift

class RecipeViewController: UITableViewController {
    
    let realm = try! Realm()

    @IBOutlet var recipeTableView: UITableView!
    
    var recipeList: Results<Recipe>?
    
    //MARK ========= Method add new recipe =========
    @IBAction func addNewRecipe(_ sender: UIBarButtonItem) {
        var textFieldTitle = UITextField()
        
        let alert = UIAlertController(title: "Add new recipe", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add recipe", style: .default) { (action) in
                
            let addRecipe = Recipe()
            addRecipe.title = textFieldTitle.text!
            self.save(newRecipe : addRecipe)
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Recipe Title"
            textFieldTitle = alertTextField
        }
                
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }    //======end of function addNewRecipe========

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK - check path for table
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
       recipeTableView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCustomCell")
        
       loadRecipe()
    }

    //MARK : Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCustomCell", for: indexPath) as! CustomCellTableViewCell
        
        let recipe =  recipeList?[indexPath.row]
        cell.recipeTitle.text = recipe?.title ?? "No Recipe Added"
//        cell.textLabel?.text = recipeList?[indexPath.row].title ?? "No Recipe Added"
        //cell.recipeImage.image = recipe.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToHowToMake", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailRecipeTableViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedRecipe = recipeList?[indexPath.row]
        }
//        let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.selectedRecipe = recipeList?[indexPath.row]
//        }
    }
    
    
    //MARK - Data manipuation
    
    func save(newRecipe : Recipe) {
        do {
            try realm.write {
                realm.add(newRecipe)
            }
        }catch{
            print("Print context saving Eror : \(error)")
        }
        
        tableView.reloadData()
    }

    func loadRecipe() {
        recipeList = realm.objects(Recipe.self)
        tableView.reloadData()
        
    }
}

