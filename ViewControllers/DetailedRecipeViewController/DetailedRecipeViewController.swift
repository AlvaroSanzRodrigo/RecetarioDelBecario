//
//  DetailedRecipeViewController.swift
//  RecetarioDelBecario
//
//  Created by Álvaro Sanz Rodrigo on 28/11/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class DetailedRecipeViewController: UIViewController {
    var recipe: Recipe!
    
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var howToTextView: UITextView!
    convenience init(_ recipe: Recipe) {
        self.init()
        self.recipe = recipe
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = recipe.name
        howToTextView.text = recipe.howTo
        registerCells()
    }
    
    private func registerCells(){
        let identifier = "RecipeTableViewCell"
        let cellNib = UINib(nibName: identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension DetailedRecipeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipe.ingredients.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: RecipeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell)!
        cell.ingredientLabel.text = recipe.ingredients[indexPath.row]
        
        return cell
    }
}
