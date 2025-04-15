//
//  NoteFormatter.swift
//  Chilesha
//
//  Created by shayne song on 4/11/25.
//

import Foundation
import SwiftUI

class NoteFormatter {
    static func notes(from items: FetchedResults<Note>) -> [NoteModel] {
        let noteModels = items.map { i in
            NoteModel(note: i)
        }
        return noteModels
    }
}
