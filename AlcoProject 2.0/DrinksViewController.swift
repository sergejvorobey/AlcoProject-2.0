//
//  ViewController.swift
//  AlcoProject 2.0
//
//  Created by Sergey Vorobey on 27/01/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let provider = DrinkProvider()
    lazy var drinks = provider.drinks

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

// MARK: table view delegete, table view data source

extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
   
    //define count cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    //set the cell identifier and which controller it belongs to
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkTableViewCell", for: indexPath) as! DrinkTableViewCell
        
        let drink = drinks[indexPath.row]
        
        cell.nameLabel.text = drink.name
        cell.detailsLabel.text = drink.details
        cell.alcoholLevelLabel.text = drink.alcoholLevel
        
        return cell
    }
    
    /*
    we say that when you click on the cell on which controller the information
    will be displayed and on which segue  indicator
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInfoAlcohol", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DrinkInfoViewController {
            
            destination.drinkInfo = drinks[tableView.indexPathForSelectedRow!.row]
        
        }
    }
    
    
    // cancel button 
    @IBAction func cancelAction( _ segue: UIStoryboardSegue) {}
}


