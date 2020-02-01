//
//  DrinkInfoViewController.swift
//  AlcoProject 2.0
//
//  Created by Sergey Vorobey on 28/01/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import UIKit

class DrinkInfoViewController: UIViewController {
    
    var drinkInfo: Drink?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alcoholLevelLebel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var imageAlcohol: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = drinkInfo?.name
        alcoholLevelLebel.text = drinkInfo?.alcoholLevel
        detailsLabel.text = drinkInfo?.details
        imageAlcohol.image = UIImage(named: (drinkInfo?.image)!)

    }
}
