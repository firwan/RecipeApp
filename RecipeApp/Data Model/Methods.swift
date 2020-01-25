//
//  Methods.swift
//  RecipeApp
//
//  Created by Firwan Moksin on 24/01/2020.
//  Copyright © 2020 FrostGarde Tech. All rights reserved.
//

import Foundation
import RealmSwift

class Methods: Object{
    @objc dynamic var method : String = ""
    var parentRecipe = LinkingObjects(fromType: Recipe.self, property: "linkMethods")
}
