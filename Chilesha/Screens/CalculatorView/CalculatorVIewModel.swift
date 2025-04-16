//
//  CalculatorVIewModel.swift
//  Chilesha
//
//  Created by shayne song on 4/7/25.
//

import Foundation
import SwiftUI

final class CalculatorViewModel: ObservableObject {
    @Published var calculatorData: [MealFood] = []
    @Published var showSearchSheet: Bool = false
    @Published var showFoodCard: Bool = false
    @Published var selectedMealFood: MealFood = MealFood(food: FoodData.data[0], gram: 1, totalCalories: 1)

    func add(food: Food, gram: Double = 0) {
        let mealFood = MealFood(food: food, gram: gram, totalCalories: gram * Double.dividedBy100(food.caloriesPer100g))
        calculatorData.insert(mealFood, at: 0)
    }
    
    func update(gram: Double) {
        if let i = calculatorData.firstIndex(where: { $0.id == selectedMealFood.id } ) {
            selectedMealFood.totalCalories = Double.dividedBy100(selectedMealFood.food.caloriesPer100g) * gram
            selectedMealFood.gram = gram
            calculatorData[i] = selectedMealFood
        }
    }
    
    func getTotalCal() -> Double {
        let subtotal = calculatorData.reduce(0) { $0 + $1.totalCalories }
        return subtotal
    }
}
