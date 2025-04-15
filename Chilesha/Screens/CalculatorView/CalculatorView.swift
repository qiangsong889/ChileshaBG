//
//  CalculatorView.swift
//  Chilesha
//
//  Created by shayne song on 4/6/25.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var calculatorView: CalculatorViewModel
    @EnvironmentObject var recordModel: RecordModel
    @State var showNumberPad = false
    @State private var settingsDetent = PresentationDetent.medium
    @Environment(\.modelContext) private var context
    //    @Query(sort: \Book.status) private var books: [Book]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                
                VStack {
                    List($calculatorView.calculatorData, id: \.self, editActions: .delete) { $mealFood in
                        CalculatorFoodCell(mealFood: mealFood)
                            .onTapGesture {
                                calculatorView.selectedMealFood = mealFood
                                showNumberPad = true
                            }
                            .frame(height: 50)
                    }
                    .animation(.bouncy, value: calculatorView.calculatorData)
                    .listStyle(.plain)
                    
                    HStack {
                        Text("Total Calories:")
                            .fontDesign(.monospaced)
                        Text("\(calculatorView.getTotalCal(), specifier: "%.2f")")
                            .fontDesign(.monospaced)
                    }
                }
                .shadow(radius: 40)
                .navigationTitle("Calculator")
                .navigationBarTitleDisplayMode(.inline)
                .background(Color(.systemBackground))
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        HStack {
                            Spacer()
                            Button {
                                addMealFood(calculatorView.calculatorData)
                            } label: {
                                Image(systemName: "plus")
                            }
                            
                        }
                    }
                }
                
                NavigationLink {
                    SearchView()
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(Color.brandPrimary)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                
                
            }
        }
        .sheet(isPresented: $showNumberPad, content: {
            NumberPadView(showNumberPad: $showNumberPad, type: .Update)
                .presentationDetents(
                    [.medium],
                    selection: $settingsDetent
                )
        })
        
    }
    
    func addMealFood(_ foods: [MealFood]) -> Void {
//        let createdDate: Date =  Calendar.current.date(byAdding: .day, value: -2, to: Date.now)!
        let createdDate: Date = Date.now
        let addCreateDate: [MealFood] = foods.map { mealFood in
            let modified = mealFood
            modified.createdDate = createdDate
            return modified
        }
        do {
            for mealFood in addCreateDate {
                context.insert(mealFood)
            }
            try context.save()
            calculatorView.calculatorData = []
            print("save success")
        } catch {
            print("Insert failed: \(error)")
        }
    }
}

#Preview {
    CalculatorView()
        .environmentObject(CalculatorViewModel())
}
