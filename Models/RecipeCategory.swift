//
//  RecipeCategory.swift
//  RecetarioDelBecario
//
//  Created by Álvaro Sanz Rodrigo on 28/11/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import Foundation

class RecipeCategory {
    var name: String!
    var imageUrl: String!
    var description: String!
    var recipes: [Recipe]!
    
    init(name: String, imageUrl: String, description: String, recipes: [Recipe]) {
        self.name = name
        self.imageUrl = imageUrl
        self.description = description
        self.recipes = recipes
    }
}
