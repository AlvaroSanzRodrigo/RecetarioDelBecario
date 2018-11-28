//
//  HomeViewController.swift
//  RecetarioDelBecario
//
//  Created by Álvaro Sanz Rodrigo on 28/11/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var categoriesArray:[RecipeCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PostTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell)!
        let user = usersArray[indexPath.row]
        cell.lblTitle.text = user.name + " " + user.email
        return nil
    }
}
