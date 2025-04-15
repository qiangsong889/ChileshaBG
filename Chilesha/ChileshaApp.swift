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
        }
    }
    init() {
        let schema = Schema([Book.self, MealFood.self])
        let config = ModelConfiguration("ChileshaDB", schema: schema)
        
        do {
            container = try ModelContainer(for: schema, configurations: config)
            
        } catch {
            fatalError("Could not configure the container")
        }
//        let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "MyBooks.store"))
//        print("path \(URL.documentsDirectory.appending(path: "MyBooks.store"))")
//        do {
//            container = try ModelContainer(for: Book.self, configurations: config)
//        } catch {
//            fatalError("Could not cofngire the container")
//        }
//        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
