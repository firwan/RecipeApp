//
//  CustomCellTableViewCell.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 22/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import UIKit
import CoreData

class CustomCellTableViewCell: UITableViewCell {

    //MARK - 
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeMethods: UILabel!
    
    var itemArray = [Recipe]()
    
    let saveContext = RecipeViewController()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func butonPressAddIngredients(_ sender: UIButton) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add the ingredients", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Done", style: .default) { (UIAlertAction) in
            let textIngredients = Recipe(context: self.context)
            textIngredients.ingredients = textField.text!
            
            self.itemArray.append(textIngredients)
            self.saveContext.tableView.reloadData()
            
            self.saveContext.saveRecipe()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Place Ingredients here"
            textField = alertTextField
        }
        
        alert.addAction(action)
        saveContext.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonPressAddMethods(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
