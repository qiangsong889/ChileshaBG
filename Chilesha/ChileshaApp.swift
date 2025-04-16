//
//  ChileshaApp.swift
//  Chilesha
//
//  Created by shayne song on 4/5/25.
//

import SwiftUI
import SwiftData

@main
struct ChileshaApp: App {
    var router = NavigationRouter()
    var calculatorViewModel = CalculatorViewModel()
    var caloriesRecordModel = RecordModel()
    let container: ModelContainer
//    SchemaMigrationPlan
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(calculatorViewModel)
                .environmentObject(caloriesRecordModel)
                .modelContainer(container)
                .environmentObject(router)
        }
    }
    init() {
        let schema = Schema([MealFood.self, Food.self])
        let config = ModelConfiguration("ChileshaDB", schema: schema)
        
        do {
            container = try ModelContainer(for: schema, configurations: config)
            
        } catch {
            fatalError("Could not configure the container")
        }
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
