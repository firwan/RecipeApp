//
//  ViewController.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 21/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import UIKit

class RecipeViewController: UITableViewController {

    @IBOutlet var recipeTableView: UITableView!
    let itemArray = ["cake", "mee", "mushroom soup"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}

