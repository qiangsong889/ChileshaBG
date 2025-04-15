//
//  FoodCardView.swift
//  Chilesha
//
//  Created by shayne song on 4/8/25.
//

import SwiftUI

import SwiftUI

struct FoodCardView: View {
    @EnvironmentObject var calculatorView: CalculatorViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
//            Color(.systemBackground)
//                .ignoresSafeArea()
            VStack {
                Image(calculatorView.selectedMealFood.food.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                
                VStack {
                    Text(calculatorView.selectedMealFood.food.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                HStack(spacing: 40) {
                    NutritionInfo(caloriesPer100g: calculatorView.selectedMealFood.food.caloriesPer100g)
                }
                .padding()
                Spacer()
                HStack {
                    Text("Total Kcal:")
                        .fontWeight(.semibold)
                    Text("\(calculatorView.selectedMealFood.gram * calculatorView.selectedMealFood.food.caloriesPer1g, specifier: "%.2f")")
                        .fontWeight(.semibold)
                    
                }
                .padding()
                HStack {
                    Text("Total Gram:")
                        .fontWeight(.semibold)
                    TextField("test", value: $calculatorView.selectedMealFood.gram, formatter: NumberFormatter())
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: 70, height: 30)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.5))
                        }
                        .onAppear {
                             // Auto-focus when view appears
                             DispatchQueue.main.async {
                                 isFocused = true
                             }
                         }
                    
                }
                .padding()
                Button("Update", action: {
//                    calculatorView.update()
//                    print(calculatorView.selectedMealFood)
                })
//                .foregroundStyle(textColor)
                .padding(.bottom, 30)
                .standardButtonStyle()
//                .modifier()
                Spacer()
            }
            .frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 30)
            .onAppear() {
            }
            .overlay(Button {
                calculatorView.showFoodCard = false
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .padding()
            }, alignment: .topTrailing)
//            .onAppear()
            
        }
    }
}


struct NutritionInfo: View {
    
    let caloriesPer100g: Double
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Calories / 100g")
                .bold()
                .font(.caption)
            
            Text("\(caloriesPer100g, specifier: "%.2f") Kcal")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    FoodCardView()
        .environmentObject(CalculatorViewModel())
}
