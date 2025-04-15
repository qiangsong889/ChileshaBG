//
//  MealModel.swift
//  Chilesha
//
//  Created by shayne song on 4/6/25.
//

import Foundation

struct Meal: Identifiable {
    var id = UUID()
    var foodsInMeal: [MealFood]
    var timeStamp: Date
    var totalCaloris: Double
}

struct MealADay: Identifiable {
    var id = UUID()
//    var meals: [Meal]
    var mealFoods: [MealFood]
    var dateString: String
    var caloriesADay: Double
}

