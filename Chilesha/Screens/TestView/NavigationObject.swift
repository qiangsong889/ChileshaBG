//
//  NavigationObject.swift
//  Chilesha
//
//  Created by shayne song on 4/15/25.
//

import SwiftUI

//class NavigationRouter: ObservableObject {
//    @Published var path = NavigationPath()
//    
//    func popToRoot() {
//        path.removeLast(path.count)
//    }
//}

struct NavigationObject: View {
    @StateObject private var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                NavigationLink("Go to Detail", value: "Detail")
            }
            .navigationDestination(for: String.self) { value in
                if value == "Detail" {
                    DetailView()
                }
            }
        }
        .environmentObject(router)
    }
}

struct DetailView: View {
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack {
            Text("Detail View")
            
            Button("Return to Main") {
                router.popToRoot()
            }
        }
    }
}

#Preview {
    NavigationObject()
}
