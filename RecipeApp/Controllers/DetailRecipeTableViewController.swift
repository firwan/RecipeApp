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

    var ingredientsArray  : Results <Ingredients>?
    var methodArray : Results <Methods>?
    
    let realm = try! Realm()
    
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
        return ingredientsArray?.count ?? 1
    }
    
    
    
    
    //MARK: - Data Manipulation Method
    
    func loadData () {
        ingredientsArray = selectedRecipe?.linkIngredients
        tableView.reloadData()
    }
    
    //MARK: - Add new Ingredients and Methods
    
    
    @IBAction func addIngredientMethods(_ sender: UIBarButtonItem) {
    }
    
    //MARK: - TableView Delegate Methods
    
}
