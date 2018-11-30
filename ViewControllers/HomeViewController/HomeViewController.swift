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
        
        let recipeRaviolis = Recipe(name: "Raviolis", imageUrl: "https://www.saveur.com/sites/saveur.com/files/styles/1000_1x_/public/ravioli-pasta_2000x1500.jpg?itok=if20Mzb7&fc=50,50", description: "Delicius italian pasta", ingredients: ["raviolis", "water", "perejil"], howTo: "Just boil the water add raviolis and perejil", location: [Double(10), Double(10)], dificulty: 4)
        let recipePenne = Recipe(name: "Penne a la rabiatta ", imageUrl: "https://www.ndtv.com/cooks/images/arabiata_med.jpg", description: "Penne a la rabiatta very picante", ingredients: ["Penne", "Rabiata", "Water", "Steriotypical italian chef"], howTo: "Call a Capo and offer some olives in exchange of him cooking the pasta for you", location: [Double(16), Double(16)], dificulty: 9)
        let recipeCarbonara = Recipe(name: "Spaghetti Carbonara", imageUrl: "https://static01.nyt.com/images/2018/08/10/dining/carbonara-horizontal/carbonara-horizontal-threeByTwoMediumAt2X.jpg", description: "Spaghetti with some cream milk and pepper", ingredients: ["Pepper", "Spaghettis", "Water", "Bacon", "Salt", "Sliced Onions"], howTo: "I dont really know how to do this meal, ask your mother, she will teach you for sure", location: [43.35, 11.016667], dificulty: 3)
        let recipeLasagna = Recipe(name: "Lasagna", imageUrl: "https://www.deliciosi.com/images/1800/1894/lasagna-sin-horno.jpg", description: "Grafield's favourite meal", ingredients: ["Beshamel", "Mince", "Sheets for lasagna", "Things"], howTo: "Preheat oven to 350 degrees F (175 degrees C). In a large skillet, cook and stir ground beef until brown.In a medium size bowl, combine cottage cheese, ricotta cheese, grated Parmesan cheese, and eggs. Spread a thin layer of the meat sauce in the bottom of a 13x9 inch pan. ... Bake in preheated oven for 45 minutes", location: [54.0, 45.0], dificulty: 8)
        
        let categoryPasta = RecipeCategory(name: "Pastas", imageUrl: "https://www.recetasderechupete.com/wp-content/uploads/2016/05/Distintos-tipos-de-pasta-copia-525x360.jpg", description: "Mamma mía!", recipes: [recipePenne, recipeLasagna, recipeRaviolis, recipeCarbonara])
        
        let recipeSteak = Recipe(name: "Rare Steak", imageUrl: "https://thenypost.files.wordpress.com/2018/04/rare_porter1a.jpg?quality=90&strip=all&strip=all", description: "Not soo cooked steak", ingredients: ["A steak", "French fries"], howTo: "Put the steak on a cooktop, wait a minute, that's all", location: [60.0, 60.0], dificulty: 2)
        let recipeMeatball = Recipe(name: "Meatballs", imageUrl: "https://hips.hearstapps.com/del.h-cdn.co/assets/18/10/1520276784-delish-general-tsos-meatballs-still004.jpg", description: "Juicy balls", ingredients: ["Mince", "I'am tired of typing these example data"], howTo: "Dunno how to do this", location: [23.0,32.0], dificulty: 8)
        
        let categoryMeat = RecipeCategory(name: "Meats", imageUrl: "https://cache-blog.credit.com/wp-content/uploads/2016/04/butcher_shop.jpg", description: "It's truly dead animals", recipes: [recipeSteak, recipeMeatball])
        
        categoriesArray.append(categorySandwich)
        categoriesArray.append(categoryPasta)
        categoriesArray.append(categoryMeat)
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
