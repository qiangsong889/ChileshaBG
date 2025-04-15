//
//  String+Ext.swift
//  Chilesha
//
//  Created by shayne song on 4/7/25.
//

import Foundation

extension String {
    func containsCaseInsensitive(_ string: String) -> Bool {
        return self.range(of: string, options: .caseInsensitive) != nil
    }
}
