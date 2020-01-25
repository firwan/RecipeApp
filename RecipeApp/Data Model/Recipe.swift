//
//  Recipe.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 24/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import Foundation
import RealmSwift

class Recipe :Object {
    @objc dynamic var title : String = ""
    @objc dynamic var image : String = ""
    let linkIngredientsMethods = List<IngredientsMethods>()
}
