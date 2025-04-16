//
//  CaloriesRecordList.swift
//  Chilesha
//
//  Created by shayne song on 4/6/25.
//

import Foundation

final class RecordModel: ObservableObject {
    
    @Published var records: [Meal] = []
    @Published var arrayOfMealADay: [MealADay] = []
    
    func add(mealFood: [MealFood], totalCalories: Double) ->Void {
//        records.insert(Meal(foodsInMeal: mealFood, timeStamp: Date(), totalCaloris: totalCalories), at: 0)
    }
    
    func sectionRecordByDate(_ arrayOfMeals: [MealFood]) {
        // clear data
        arrayOfMealADay = []
        var arrayOfDates: [String] = []
        
        for meal in arrayOfMeals {
            // get all the dates in an array
            let dateString = meal.createdDate!.formatted(date: .abbreviated, time: .omitted)
            let idx = arrayOfDates.firstIndex(of: dateString)
            if idx == nil {
                arrayOfDates.append(dateString)
            }
        }
        
        for dateString in arrayOfDates {
            var mealFoods: [MealFood] = []
            var caloriesADay: Double = 0
            
            for mealFood in arrayOfMeals {
                if mealFood.createdDate!.formatted(date: .abbreviated, time: .omitted) == dateString {
                    print("this is each mealfood \(mealFood) \(mealFood.food) \(mealFood.food.name)")
                    mealFoods.append(mealFood)
                    caloriesADay = caloriesADay + mealFood.totalCalories
                }
            }
            arrayOfMealADay.append(MealADay(mealFoods: mealFoods, dateString: dateString, caloriesADay: caloriesADay))
        }
        
    }
    
    //
    //    var totalPrice: Double {
    //        items.reduce(0) { $0 + $1.price }
    //    }
    //
    //
    //    func add(_ appetizer: Appetizer) {
    //        items.append(appetizer)
    //    }
    //
    //
    //    func deleteItems(at offsets: IndexSet) {
    //        items.remove(atOffsets: offsets)
    //    }
}
