//
//  Ingredients.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 24/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import Foundation
import RealmSwift

class Ingredients: Object {
    @objc dynamic var ingredients : String = ""
    var parentRecipe = LinkingObjects(fromType: Recipe.self, property: "linkIngredients")
}
