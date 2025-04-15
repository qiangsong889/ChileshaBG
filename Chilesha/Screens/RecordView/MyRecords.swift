//
//  MyRecords.swift
//  Chilesha
//
//  Created by shayne song on 4/6/25.
//

import SwiftUI
import SwiftData

struct MyRecords: View {
    @EnvironmentObject var recordModel: RecordModel
    @Query(sort: \MealFood.createdDate, order: .reverse) private var MealFoods: [MealFood]
    
    @State private var records = []
    var body: some View {
        VStack {
            NavigationStack {
                List(recordModel.arrayOfMealADay) { mealADay in
                    HStack {
                        Text(mealADay.dateString)
                        Spacer()
                        Text("\(mealADay.caloriesADay, specifier: "%.2f")")
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("My Records")
            }
        }
        .onAppear(perform: {
//            recordModel.sectionRecordByDate()
            recordModel.sectionRecordByDate(MealFoods)
            print("onAppera \(MealFoods)")
            
        })
    }

}

#Preview {
    MyRecords()
        .environmentObject(RecordModel())
}
