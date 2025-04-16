//
//  RouterManager.swift
//  Chilesha
//
//  Created by shayne song on 4/15/25.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
