//
//  TestView.swift
//  Chilesha
//
//  Created by shayne song on 4/11/25.
//

import SwiftUI
import SwiftData

struct TestView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Book.status) private var books: [Book]
    @State private var createNewBook = false
    
    var body: some View {
        NavigationStack {
            Group {
                if books.isEmpty {
                    ContentUnavailableView("Enter your fist book", systemImage: "book.fill")
                } else {
                    List {
                        ForEach(books) { book in
                            NavigationLink {
                                EditBookView(book: book)
                            } label: {
                                HStack {
                                    book.icon
                                    VStack {
                                        Text(book.title)
                                        Text(book.author)
                                        if let rating = book.rating {
                                            HStack {
                                                ForEach(1..<rating, id: \.self) {
                                                    _ in Image(systemName: "star.fill")
                                                        .imageScale(.small)
                                                        .foregroundStyle(.yellow)
                                                }
                                            }
                                        }
                                    } 
                                }
                            }
                            
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("My Books")
            .toolbar {
                Button("Create") {
                    createNewBook = true
                }
            }
            .sheet(isPresented: $createNewBook, content: {
                NewBookView()
            })
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(books[index])
            }
            
            // Optional: Save context if not using autosave
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}

#Preview {
    let preview = Preview(Book.self)
    preview.addExamples(Book.sampleBooks)
    return TestView()
        .modelContainer(preview.container)
}
