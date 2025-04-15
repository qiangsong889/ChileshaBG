//
//  NoteModel.swift
//  Chilesha
//
//  Created by shayne song on 4/11/25.
//

import Foundation

struct NoteModel {
    var id: UUID = UUID()
    var content: String
    var date: Date
    var timestamp: Date
    
    init(id: UUID, content: String, date: Date, timestamp: Date) {
        self.id = id
        self.content = content
        self.date = date
        self.timestamp = timestamp
    }
    
    init(note: Note) {
        self.id = note.id!
        self.content = note.content!
        self.date = note.date!
        self.timestamp = note.timestamp!
    }
}
