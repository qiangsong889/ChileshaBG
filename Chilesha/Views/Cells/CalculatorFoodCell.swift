//
//  CalculatorFoodCell.swift
//  Chilesha
//
//  Created by shayne song on 4/9/25.
//

import SwiftUI

struct CalculatorFoodCell: View {
    var mealFood: MealFood
    var body: some View {
        ZStack{
            HStack {
                Image(mealFood.food.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                VStack(alignment: .leading) {
                    Text(mealFood.food.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\(mealFood.food.caloriesPer100g, specifier: "%.2f")Kcal/100g")
                        .font(.footnote)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(mealFood.totalCalories, specifier: "%.2f") Kcal")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\(mealFood.gram, specifier: "%.2f") g")
                        .font(.footnote)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
//    CalculatorFoodCell(mealFood: MealFood(food: FoodData.data[0], gram: 0, totalCalories: 0, createdDate: Date.now))
}
