//
//  NewBookView.swift
//  Chilesha
//
//  Created by shayne song on 4/12/25.
//

import SwiftUI

struct NewBookView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    
    var body: some View {
        ZStack{
            NavigationStack {
                Form {
                    TextField("Book Title", text: $title)
                    TextField("Author", text: $author)
                    Button("Create") {
                        addBook(title: title, author: author)
                    }
                    .disabled(title.isEmpty || author.isEmpty)
                }
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .navigationTitle("New Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button("Cancel") {
                            dismiss()
                        }
                    })
                }
            }
        }
    }
    
    func addBook(title: String, author: String) -> Void {
        let newBook = Book(title: title, author: author)
        context.insert(newBook)
        do {
            print("going to save context save")
            try context.save()
        } catch {
            print("Err add book: \(error)")
        }
        dismiss()
    }
}

#Preview {
    NewBookView()
}
