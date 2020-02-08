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
    
    private var drinks:[Drink] = []
    private let drinksProvider: DrinkProvider = DrinkProvider()
    private var promoDrink: PromoDrink?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinks = drinksProvider.drinks
    }
}

// MARK: table view delegete, table view data source

extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
   
    //define count cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // когда добавляю ячейку drinks.count + 1 - падает приложение (Index out of range)
        return drinks.count 
    }
    
    //set the cell identifier and which controller it belongs to
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {

        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PromoTableViewCell", for: indexPath) as! PromoTableViewCell

            let image = drinksProvider.promo.promoImage

            cell.imageDrinkPromo.image = image

            return cell
            
        default:

            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "DrinkTableViewCell", for: indexPath) as! DrinkTableViewCell

            let drink = drinks[indexPath.row]
            defaultCell.nameLabel.text = drink.name
            defaultCell.detailsLabel.text = drink.details
            defaultCell.alcoholLevelLabel.text = drink.alcoholLevel

            return defaultCell
        }
    }
    
    // MARK: navigation
    
//  go by cell indexPath.row to controllers with Identifier

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 2 {
            
            let OpenSiteViewController = storyboard?.instantiateViewController(withIdentifier: "OpenSiteViewController")
            
            guard let OpenSiteVC = OpenSiteViewController else { return }

            self.navigationController?.pushViewController(OpenSiteVC, animated: true)
            
            tableView.deselectRow(at: indexPath, animated: true)
            
        } else {
            
            let DrinksViewController = storyboard?.instantiateViewController(withIdentifier: "DrinkInfoViewController") as! DrinkInfoViewController

            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                DrinksViewController.drinkInfo = drinks[selectedIndexPath.row]
            }
            
            self.navigationController?.pushViewController(DrinksViewController, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // cancel button 
    @IBAction func cancelAction( _ segue: UIStoryboardSegue) {}
}


