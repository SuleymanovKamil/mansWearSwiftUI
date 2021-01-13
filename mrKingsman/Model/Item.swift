//
//  Item.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 07.01.2021.
//

import SwiftUI

struct item: Equatable {
    var name: String
    var price: Int
    var image: String
    var description: String
    
    
    static func ==(lhs: item, rhs: item) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price &&  lhs.image == rhs.image && lhs.description == rhs.description
    }
    
}

var sizes = ["XS", "S", "M", "L", "XL", "XXL"]

var hats: [item] = [
    item(name: "Кепка Enrico Marinelli", price: 2000, image: "hat1", description: "Теплая кепка из шерсти"),
    item(name: "Кепка Gottmann polo", price: 2500, image: "hat2", description: "Теплая кепка из шерсти"),
    item(name: "Кепка Gottmann polo-K", price: 3000, image: "hat3", description: "Теплая кепка из шерсти"),
]

var jackets: [item] = [
    item(name: "Жилет CERRUTI", price: 4000, image: "top1", description: "Теплый жилет из шерсти"),
    item(name: "Куртка GALLOTTI", price: 5000, image: "top2", description: "Теплая куртка из шерсти"),
    item(name: "Жилет GALLOTTI", price: 7000, image: "top3", description: "Теплый жилет из шерсти"),
]

var pants: [item] = [
    item(name: "Штаны CERRUTI", price: 3000, image: "down3", description: "Теплые штаны из шерсти"),
    item(name: "Джинсы Enrico Marinelli", price: 3500, image: "down2", description: "Теплые штаны из шерсти"),
    item(name: "Штаны GALLOTTI", price: 3000, image: "down1", description: "Теплые штаны из шерсти"),
]

var shoes: [item] = [
    item(name: "Туфли GOTTMANN", price: 8000, image: "boots1", description: "Удобная обувь"),
    item(name: "Ботинки GALLOTTI", price: 28500, image: "boots2", description: "Удобная обувь"),
    item(name: "Туфли  MARINELLI", price: 12000, image: "boots3", description: "Удобная обувь"),
]


