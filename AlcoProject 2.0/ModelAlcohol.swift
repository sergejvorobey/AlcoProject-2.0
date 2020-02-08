//
//  ModelAlcohol.swift
//  AlcoProject 2.0
//
//  Created by Sergey Vorobey on 27/01/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import Foundation
import UIKit



struct Drink {
    
    var name: String
    var details: String
    var alcoholLevel: String
    var image: String

}

struct DrinkProvider {
    
    var drinks: [Drink] {
        return [whiski, vodka, cognac]
    }
    
    var promo: PromoDrink {
        return promoImage
    }
}

struct PromoDrink {
    
    var promoImage: UIImage?

}

private let promoImage = PromoDrink(promoImage: #imageLiteral(resourceName: "Whiski"))


private let whiski = Drink(name: "Whiski",
                           details: "Крепкий ароматный алкогольный напиток, получаемый из различных видов зерна с использованием процессов соложения, брожения, перегонки и длительного выдерживания в дубовых бочках. При изготовлении виски может использоваться ячмень, рожь, пшеница или кукуруза.",
                           alcoholLevel: "39", image: "Whiski")

private let vodka = Drink(name: "Vodka",
                          details: "Крепкий алкогольный напиток, бесцветный водно-спиртовой раствор с характерным вкусом и спиртовым запахом. Процесс производства водки включает приготовление исправленной воды, смешивание ректификованного этилового спирта из пищевого сырья с исправленной водой, обработку водно-спиртового раствора активированным углём или модифицированным крахмалом, его фильтрование, внесение ингредиентов, если они предусмотрены рецептурой, перемешивание, контрольное фильтрование, разлив в потребительскую тару и оформление готовой продукции.",
                          alcoholLevel: "39", image: "Vodka")

private let cognac = Drink(name: "Cognac",
                           details: "Своё название напиток получил от имени города Коньяк (фр. Cognac), региона Новая Аквитания, департамента Шаранта, Франция. С окрестностями и самим городом Коньяк и связано появление этого алкогольного напитка.Географические границы местности, в которой допускается производство коньяка, технология производства и само название «Коньяк» строго определены, регламентированы и закреплены многочисленными законодательными актами. Коньяк является исконно французским продуктом.Крепкие напитки других стран, а также напитки, произведённые во Франции вне региона Шаранта, даже если они получены дистилляцией виноградных вин, произведённых в регионе Новая Аквитания, не имеют права именоваться коньяком на международном рынке, такие напитки принято называть бренди.",
                           alcoholLevel: "40",
                           image: "Cognac")

private let rum = Drink(name: "Rum", details: "12345", alcoholLevel: "40", image: "")
private let absent = Drink(name: "Absent", details: "12345", alcoholLevel: "40", image: "")
private let teqila = Drink(name: "Teqila", details: "12345", alcoholLevel: "40", image: "")
// доработать / добавил ячейку которая будет занимать место рекламы
//private let promoCell = Drink(name: "", details: "", alcoholLevel: "", image: "")

