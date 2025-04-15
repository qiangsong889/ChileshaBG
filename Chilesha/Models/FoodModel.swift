//
//  MealModel.swift
//  Chilesha
//
//  Created by shayne song on 4/6/25.
//

import Foundation
import SwiftData

@Model
class Food { 
    var name: String
//    let description: String
    var imageName: String
    var caloriesPer100g: Double
    var caloriesPer1g: Double
    var category: String
    
    init(name: String, imageName: String, caloriesPer100g: Double, caloriesPer1g: Double, category: String) {
        self.name = name
        self.imageName = imageName
        self.caloriesPer100g = caloriesPer100g
        self.caloriesPer1g = caloriesPer1g
        self.category = category
    }
    
    init(food: Food) {
        self.name = food.name
        self.imageName = food.imageName
        self.caloriesPer100g = food.caloriesPer100g
        self.caloriesPer1g = food.caloriesPer1g
        self.category = food.category
    }
}

@Model
class MealFood {
    var id = UUID()
    var food: Food
    var gram: Double
    var totalCalories: Double
    var createdDate: Date?
    
    init(food: Food, gram: Double, totalCalories: Double) {
        self.food = food
        self.gram = gram
        self.totalCalories = totalCalories
    }
    
    init(mealFood: MealFood) {
        self.food = mealFood.food
        self.gram = mealFood.gram
        self.totalCalories = mealFood.totalCalories
        self.createdDate = mealFood.createdDate
    }
}


