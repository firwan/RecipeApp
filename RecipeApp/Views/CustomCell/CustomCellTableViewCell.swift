//
//  CustomCellTableViewCell.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 22/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    //MARK - 
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeMethods: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
