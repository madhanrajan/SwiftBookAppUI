//
//  Book.swift
//  BookAppUI
//
//  Created by Madhan on 28/09/2023.
//

import Foundation

struct Book: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
    var rating: Int
    var bookViews: Int
}

let sampleBooks: [Book] = [
    Book(title: "The Great Adventure", imageName: "1", author: "Jane Doe", rating: 5, bookViews: 1200),
    Book(title: "Mysteries of the Deep", imageName: "2", author: "John Smith", rating: 4, bookViews: 850),
    Book(title: "The Lost City", imageName: "3", author: "Alice Johnson", rating: 3, bookViews: 920),
    Book(title: "Beyond the Stars", imageName: "4", author: "Robert Brown", rating: 5, bookViews: 1500),
    Book(title: "Tales of the Past", imageName: "5", author: "Emily White", rating: 4, bookViews: 1100)
]
