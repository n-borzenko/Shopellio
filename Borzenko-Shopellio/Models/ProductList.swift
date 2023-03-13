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
  var price: Decimal
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
      imageURL: "https://www.ocado.com/productImages/278/278141011_0_640x640.jpg?identifier=20cb081482efebd3a4aa15db31133e9e"
    ),
    Product(
      id: 2,
      name: "Conference Pears",
      price: 2.0,
      specification: "Conference Pears, Ripe & Ready x4",
      imageURL: "https://assets.sainsburys-groceries.co.uk/gol/6621757/1/640x640.jpg",
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
      imageURL: "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/31tb2t8uXYS._AC_.jpg",
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
      imageURL: "https://assets.sainsburys-groceries.co.uk/gol/7971919/1/640x640.jpg"
    ),
    Product(
      id: 5,
      name: "Post It Notes",
      price: 3.5,
      specification: "Post It Notes Super Sticky Lined Pads",
      imageURL: "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61fl-Tob7gL._AC_SL1139_.jpg",
      category: .stationery
    ),
    Product(
      id: 6,
      name: "Printer Paper",
      price: 7.5,
      specification: "A4 Printer Paper 75Gsm 500 Sheets",
      imageURL: "https://digitalcontent.api.tesco.com/v2/media/ghs/d7f07b17-b474-4c8f-9f1b-cb5c0e0642c5/123419ea-a684-4099-b780-f35cf047c08e_1118034231.jpeg?h=540&w=540",
      category: .stationery,
      reviews: [
        Review(text: "expensive, good quality", rating: 4)
      ]
    )
  ]
}
