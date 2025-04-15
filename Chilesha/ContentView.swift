//
//  ContentView.swift
//  Chilesha
//
//  Created by shayne song on 4/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Calculator", systemImage: "rectangle.and.paperclip") {
                CalculatorView()
             }
            
            Tab("Records", systemImage: "folder") {
                MyRecords()
             }

//            Tab("Test", systemImage: "testtube.2") {
//               TestView()
//            }
            
        }
    }
}

#Preview {

    ContentView()
        .environmentObject(CalculatorViewModel())
        .environmentObject(RecordModel())

}
