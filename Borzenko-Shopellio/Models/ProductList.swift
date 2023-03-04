//
//  ProductList.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 26/02/2023.
//

import Foundation

enum ProductCategory: String {
  case fruits
  case clothes
  case stationery
}

struct Review: Hashable {
  var text: String
  var imageURLs: [String]?
  var rating: Int

  func hash(into hasher: inout Hasher) {
    hasher.combine(text)
    hasher.combine(rating)
    if let images = imageURLs {
      images.forEach { image in
        hasher.combine(image)
      }
    }
  }
}

struct Product: CustomStringConvertible, Identifiable {
  let id: Int
  var name: String
  var price: Double
  var specification: String
  var imageURL: String
  var category: ProductCategory?
  var reviews: [Review] = []

  var description: String {
    return """
      \(id):
      name: \(name)
      price: \(price)
      specification: \(specification)
      imageURL: \(imageURL)
      category: \(category?.rawValue ?? "")
      reviewCount: \(reviews.count)
    """
  }
}

enum ProductList {
  static var items = [
    Product(
      id: 1,
      name: "Whole Milk",
      price: 1.3,
      specification: "Whole Milk 1.13L (2 pint)",
      imageURL: "/milk.png"
    ),
    Product(
      id: 2,
      name: "Conference Pears",
      price: 2.0,
      specification: "Conference Pears, Ripe & Ready x4",
      imageURL: "/pears.png",
      category: .fruits,
      reviews: [
        Review(text: "tasty", rating: 5),
        Review(text: "healthy", rating: 4)
      ]
    ),
    Product(
      id: 3,
      name: "Green midi skirt",
      price: 5.9,
      specification: "Women's Stretch Midi Pencil Green Skirt",
      imageURL: "/skirt_green.png",
      category: .clothes,
      reviews: [
        Review(text: "too small", rating: 3),
        Review(text: "nice one", imageURLs: ["/photo23342.jpeg", "/photo43728935.jpeg"], rating: 4)
      ]
    ),
    Product(
      id: 4,
      name: "Kitchen Towels",
      price: 3.0,
      specification: "Super Absorbent Kitchen Towels x2",
      imageURL: "/kitchen_towels.png"
    ),
    Product(
      id: 5,
      name: "Post It Notes",
      price: 3.5,
      specification: "Post It Notes Super Sticky Lined Pads",
      imageURL: "/post-it-notes.png",
      category: .stationery
    ),
    Product(
      id: 6,
      name: "Printer Paper",
      price: 7.5,
      specification: "A4 Printer Paper 75Gsm 500 Sheets",
      imageURL: "/printer_paper.png",
      category: .stationery,
      reviews: [
        Review(text: "expensive, good quality", rating: 4)
      ]
    )
  ]
}
