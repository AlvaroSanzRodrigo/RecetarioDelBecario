//
//  RecipesViewController.swift
//  RecetarioDelBecario
//
//  Created by Álvaro Sanz Rodrigo on 28/11/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    var recipes:[Recipe] = []
    var filteredRecipes:[Recipe] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    convenience init(_ recipes:[Recipe]) {
        self.init()
        self.recipes = recipes
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Search.
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        registerCells()
    }
    
    private func registerCells(){
        let identifier = "RecipeCategoryTableViewCell"
        let cellNib = UINib(nibName: identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
    }
    
    //Searching methods
    internal func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    internal func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    internal func filterContentForSearch(_ searchText: String){
        
            filteredRecipes = recipes.filter({ (recipe: Recipe) -> Bool in
                return recipe.name.lowercased().contains(searchText.lowercased()) || recipe.description.lowercased().contains(searchText.lowercased())
            })

        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension RecipesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe: Recipe
        if isFiltering(){
            recipe = filteredRecipes[indexPath.row]
        }else{
            recipe = recipes[indexPath.row]
        }
        
        let detailedRecipeVC = DetailedRecipeViewController(recipe)
        self.show(detailedRecipeVC, sender: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return filteredRecipes.count
        }
        return recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: RecipeCategoryTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "RecipeCategoryTableViewCell", for: indexPath) as? RecipeCategoryTableViewCell)!
        
        if isFiltering() {
            let recipe = filteredRecipes[indexPath.row]
            cell.titleLabel.text = recipe.name
            cell.descriptionLabel.text = "Difulty: \(recipe.dificulty!)"
            cell.imageImageView.sd_setImage(with: URL(string: recipe.imageUrl), completed: nil)
        }else{
            let recipe = recipes[indexPath.row]
            cell.titleLabel.text = recipe.name
            cell.descriptionLabel.text = "Difulty: \(recipe.dificulty!)"
            cell.imageImageView.sd_setImage(with: URL(string: recipe.imageUrl), completed: nil)

        }
        return cell
    }
}
extension RecipesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearch(searchController.searchBar.text!)
    }
}
