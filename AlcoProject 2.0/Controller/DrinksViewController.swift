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
    
    private var alcoholDrinks: [AlcoholDrink] = []
    private var nonAlcoholDrinks: [NonAlcoholDrink] = []
    private var drinks: [Drink] = []
    private let drinksProvider: DrinkProvider = DrinkProvider()
    private var promoDrink: PromoDrink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alcoholDrinks = drinksProvider.alcoholDrinks
        nonAlcoholDrinks = drinksProvider.nonAlcoholDrinks
        drinks = alcoholDrinks + nonAlcoholDrinks
        
        tableView.tableFooterView = UIView()
    }
}

// MARK: table view delegete, table view data source

extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    
    //define count cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       let allCountCell = alcoholDrinks.count + nonAlcoholDrinks.count

        return  allCountCell + 1
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

            var index = indexPath.row
            
            if indexPath.row > 1 {
                index = indexPath.row - 1
                
                defaultCell.nameLabel.text = drinks[index].name
                defaultCell.detailsLabel.text =  drinks[index].details
                defaultCell.alcoholLevelLabel.text = drinks[index].alcoholLevel

            } else {
                
                defaultCell.nameLabel.text = drinks[index].name
                defaultCell.detailsLabel.text = drinks[index].details
                defaultCell.alcoholLevelLabel.text = drinks[index].alcoholLevel
            }
            
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
                
                var selected = selectedIndexPath.row
                
                if selectedIndexPath.row > 1 {
                    selected = selectedIndexPath.row - 1

                    DrinksViewController.drinkInfo = drinks[selected]

                } else {
                    
                    DrinksViewController.drinkInfo = drinks[selected]
                }
            }
            
            self.navigationController?.pushViewController(DrinksViewController, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // cancel button 
    @IBAction func cancelAction( _ segue: UIStoryboardSegue) {}
}


