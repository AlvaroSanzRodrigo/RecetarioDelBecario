//
//  Recipe.swift
//  RecetarioDelBecario
//
//  Created by Álvaro Sanz Rodrigo on 28/11/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import Foundation

class Recipe {
    var name: String!
    var imageUrl: String!
    var description: String!
    var ingredients: [String]!
    var howTo: String!
    var location: [Double]!
    var dificulty: Int!
    
    
    
    init(name: String, imageUrl: String, description: String, ingredients: [String], howTo: String, location: [Double], dificulty:Int) {
        self.name = name
        self.imageUrl = imageUrl
        self.description = description
        self.ingredients = ingredients
        self.howTo = howTo
        self.location = location
        self.dificulty = dificulty
    }
}
