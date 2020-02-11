//
//  ModelAlcohol.swift
//  AlcoProject 2.0
//
//  Created by Sergey Vorobey on 27/01/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import Foundation
import UIKit



class Drink {
    
    var name: String
    var details: String
    var alcoholLevel: String
    var image: String
    
    init(name: String, details: String, alcoholLevel: String, image: String) {
        self.name = name
        self.details = details
        self.alcoholLevel = alcoholLevel
        self.image = image
    }
}

class NonAlcoholDrink: Drink {
    
    override init(name: String, details: String, alcoholLevel: String, image: String) {
        super.init(name: name, details: details, alcoholLevel: alcoholLevel, image: image)
        self.alcoholLevel = "none alcohol"
    }
}

class AlcoholDrink: Drink {
   
    override init(name: String, details: String, alcoholLevel: String, image: String) {
        super.init(name: name, details: details, alcoholLevel: alcoholLevel, image: image)
    }
}

struct DrinkProvider {
    
    var alcoholDrinks: [AlcoholDrink] {
        return [whiski, vodka, cognac]
    }
    
    var nonAlcoholDrinks: [NonAlcoholDrink] {
        return [cola, fanta, sprite]
    }
    
    var promo: PromoDrink {
        return promoImage
    }
}

struct PromoDrink {
    
    var promoImage: UIImage?

}

private let promoImage = PromoDrink(promoImage: #imageLiteral(resourceName: "Whiski"))


private let whiski = AlcoholDrink(name: "Whiski",
                           details: "Крепкий ароматный алкогольный напиток, получаемый из различных видов зерна с использованием процессов соложения, брожения, перегонки и длительного выдерживания в дубовых бочках. При изготовлении виски может использоваться ячмень, рожь, пшеница или кукуруза.",
                           alcoholLevel: "39", image: "Whiski")

private let vodka = AlcoholDrink(name: "Vodka",
                          details: "Крепкий алкогольный напиток, бесцветный водно-спиртовой раствор с характерным вкусом и спиртовым запахом. Процесс производства водки включает приготовление исправленной воды, смешивание ректификованного этилового спирта из пищевого сырья с исправленной водой, обработку водно-спиртового раствора активированным углём или модифицированным крахмалом, его фильтрование, внесение ингредиентов, если они предусмотрены рецептурой, перемешивание, контрольное фильтрование, разлив в потребительскую тару и оформление готовой продукции.",
                          alcoholLevel: "39", image: "Vodka")

private let cognac = AlcoholDrink(name: "Cognac",
                           details: "Своё название напиток получил от имени города Коньяк (фр. Cognac), региона Новая Аквитания, департамента Шаранта, Франция. С окрестностями и самим городом Коньяк и связано появление этого алкогольного напитка.Географические границы местности, в которой допускается производство коньяка, технология производства и само название «Коньяк» строго определены, регламентированы и закреплены многочисленными законодательными актами. Коньяк является исконно французским продуктом.Крепкие напитки других стран, а также напитки, произведённые во Франции вне региона Шаранта, даже если они получены дистилляцией виноградных вин, произведённых в регионе Новая Аквитания, не имеют права именоваться коньяком на международном рынке, такие напитки принято называть бренди.",
                           alcoholLevel: "40",
                           image: "Cognac")

private let cola = NonAlcoholDrink(name: "Coca-Cola",
                                   details: "Безалкогольный газированный напиток, производимый компанией «The Coca-Cola Company». «Кока-Кола» была признана самым дорогим брендом в мире в 2005-2015 годах в рейтинге международного исследовательского агентства Interbrand.",
                                   alcoholLevel: "",
                                   image: "Coca-Cola")

private let fanta = NonAlcoholDrink(name: "Fanta",
                                   details: "Безалкогольный газированный напиток, производимый компанией «The Coca-Cola Company». «Кока-Кола» была признана самым дорогим брендом в мире в 2005-2015 годах в рейтинге международного исследовательского агентства Interbrand.",
                                   alcoholLevel: "",
                                   image: "Fanta")

private let sprite = NonAlcoholDrink(name: "Sprite",
                                   details: "Безалкогольный газированный напиток, производимый компанией «The Coca-Cola Company». «Кока-Кола» была признана самым дорогим брендом в мире в 2005-2015 годах в рейтинге международного исследовательского агентства Interbrand.",
                                   alcoholLevel: "",
                                   image: "Sprite")

