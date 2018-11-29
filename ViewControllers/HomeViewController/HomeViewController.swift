//
//  HomeViewController.swift
//  RecetarioDelBecario
//
//  Created by Álvaro Sanz Rodrigo on 28/11/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import SDWebImage


class HomeViewController: UIViewController {
    
    var categoriesArray:[RecipeCategory] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recetario del Becario"
        populateRecipes()
        registerCells()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func registerCells(){
        let identifier = "RecipeCategoryTableViewCell"
        let cellNib = UINib(nibName: identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
    }
    
    private func populateRecipes(){
        let recipeSandwich1 = Recipe(name: "Ham and cheese sandwich", imageUrl: "https://www.divinacocina.es/wp-content/uploads/sandwich-blt.jpg", description: "classic sandwich", ingredients: ["ham", "tranchetes", "sandwich bread"], howTo: "Put a slice of ham on a slice of bread, then add a slice of cheese and then add another slice of bread", location: [Double(10), Double(10)], dificulty: 5)
        let recipeSandwich2 = Recipe(name: "Just cheese sandwich", imageUrl: "https://www.divinacocina.es/wp-content/uploads/sandwich-blt.jpg", description: "classic sandwich", ingredients: ["ham", "sandwich bread"], howTo: "Put a slice of cheese on a slice of bread, then add slice of bread", location: [Double(10), Double(10)], dificulty: 3)
        let recipeSandwich3 = Recipe(name: "Just ham sandwich", imageUrl: "https://www.divinacocina.es/wp-content/uploads/sandwich-blt.jpg", description: "classic sandwich", ingredients: ["ham", "tranchetes", "sandwich bread"], howTo: "Put a slice of ham on a slice of bread, then add another slice of bread", location: [Double(10), Double(10)], dificulty: 3)
        
        let categorySandwich = RecipeCategory(name: "Sandwiches", imageUrl: "https://www.divinacocina.es/wp-content/uploads/sandwich-blt.jpg", description: "The goold old one", recipes: [recipeSandwich1, recipeSandwich2, recipeSandwich3])
        
        let recipeRaviolis = Recipe(name: "Raviolis", imageUrl: <#T##String#>, description: "Delicius italian pasta", ingredients: ["raviolis", "water", "perejil"], howTo: "Just boil the water add raviolis and perejil", location: [Double(10), Double(10)], dificulty: 4)
        
        categoriesArray.append(categorySandwich)
    }
    
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didselected ", indexPath.row)
        let recipes = categoriesArray[indexPath.row].recipes
        let recipesVC = RecipesViewController(recipes!)
        self.show(recipesVC, sender: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: RecipeCategoryTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "RecipeCategoryTableViewCell", for: indexPath) as? RecipeCategoryTableViewCell)!
        let recipeCategory = categoriesArray[indexPath.row]
        cell.titleLabel.text = recipeCategory.name
        cell.descriptionLabel.text = recipeCategory.description
        cell.imageImageView.sd_setImage(with: URL(string: recipeCategory.imageUrl), completed: nil)
        return cell
    }
}
