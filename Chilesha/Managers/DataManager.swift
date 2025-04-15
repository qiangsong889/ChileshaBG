//
//  DataManager.swift
//  Chilesha
//
//  Created by shayne song on 4/11/25.
//

import Foundation
import CoreData

class DataManager {
    static var shared = DataManager()
    let viewContext: NSManagedObjectContext
    
    init() {
        viewContext = PersistenceController.shared.container.viewContext
    }
    
    func saveNewNote(noteModel: NoteModel) async -> Void{
        let noteEntity = Note(context: viewContext)
        noteEntity.id = noteModel.id
        noteEntity.content = noteModel.content
        noteEntity.date = noteModel.date
        noteEntity.timestamp = .now
        
        try? viewContext.save()
        print("note with id \(noteModel.id) is saved")
    }
    
    func updateNote(noteModel: NoteModel) async -> Void {
        let fetchRequest = Note.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", noteModel.id.uuidString)
        
        if let existingNote = try? viewContext.fetch(fetchRequest).first {
            existingNote.content = noteModel.content
            existingNote.date = noteModel.date
            
            try? viewContext.save()
        } else {
            print("Note not found")
        }
    }
    
    func deleteNote(id: UUID) async -> Void {
        do {
            let fetchRequest = Note.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
            
            if let noteToDelete = try viewContext.fetch(fetchRequest).first {
                viewContext.delete(noteToDelete)
                
                try viewContext.save()
            }
        } catch {
            
        }
    }
    
}
