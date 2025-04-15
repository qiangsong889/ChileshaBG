//
//  SearchViewModel.swift
//  Chilesha
//
//  Created by shayne song on 4/7/25.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var showFoodCardView: Bool = false
    @Published var searchText: String = ""
    @Published var selectedFood: Food?
}

struct FoodData {
    static let data = [
        Food(name: "Apple", imageName: "apple", caloriesPer100g: 52.1, caloriesPer1g: 0.521, category: "fruit"),
        Food(name: "Banana", imageName: "banana", caloriesPer100g: 88.7, caloriesPer1g: 0.887, category: "fruit"),
        Food(name: "BlueBerry", imageName: "blueberries", caloriesPer100g: 57.7, caloriesPer1g: 0.577, category: "fruit"),
        Food(name: "Broccoli", imageName: "broccoli", caloriesPer100g: 33.7, caloriesPer1g: 0.337, category: "vegetable"),
        Food(name: "Drink", imageName: "drink1", caloriesPer100g: 100, caloriesPer1g: 1, category: "beverage"),
        Food(name: "Egg",  imageName: "egg", caloriesPer100g: 155.1, caloriesPer1g: 1.55, category: "protein"),
        Food(name: "Fish", imageName: "fish", caloriesPer100g: 205.8, caloriesPer1g: 2.05, category: "protein"),
        Food(name: "Food",imageName: "food", caloriesPer100g: 100, caloriesPer1g: 1, category: "other"),
        Food(name: "Kiwi", imageName: "kiwi", caloriesPer100g: 60.9, caloriesPer1g: 0.609, category: "fruit"),
        Food(name: "Milk", imageName: "drink2", caloriesPer100g: 42.3, caloriesPer1g: 0.423, category: "dairy"),
        Food(name: "Noodle", imageName: "noodle", caloriesPer100g: 138.1, caloriesPer1g: 1.38, category: "dairy"),
        Food(name: "Corn",  imageName: "corn", caloriesPer100g: 71, caloriesPer1g: 0.71, category: "grain"),
        Food(name: "Orange",  imageName: "orange", caloriesPer100g: 47.1, caloriesPer1g: 0.471, category: "fruit"),
        Food(name: "Pizza",  imageName: "pizza", caloriesPer100g: 266, caloriesPer1g: 2.66, category: "other"),
        Food(name: "Potato",  imageName: "potato", caloriesPer100g: 87, caloriesPer1g: 0.87, category: "vegetable"),
        Food(name: "Pumpkin",  imageName: "pumpkin", caloriesPer100g: 46, caloriesPer1g: 0.46, category: "vegetable"),
        Food(name: "Shrimp",  imageName: "shrimp", caloriesPer100g: 91, caloriesPer1g: 0.91, category: "protein"),
        Food(name: "Steak",  imageName: "steak", caloriesPer100g: 270, caloriesPer1g: 2.7, category: "protein"),
        Food(name: "Strawberry",  imageName: "strawberry", caloriesPer100g: 32.5, caloriesPer1g: 0.325, category: "fruit"),
        Food(name: "Sweet Potato",  imageName: "sweet-potato", caloriesPer100g: 84, caloriesPer1g: 0.84, category: "vegetable"),
        Food(name: "Tomato",  imageName: "tomato", caloriesPer100g: 18, caloriesPer1g: 0.18, category: "vegetable"),
        Food(name: "White Rice",  imageName: "white-rice", caloriesPer100g: 130, caloriesPer1g: 1.3, category: "grain"),
        Food(name: "Yogurt",  imageName: "yogurt", caloriesPer100g: 58.8, caloriesPer1g: 0.588, category: "dairy"),
    ]
}
