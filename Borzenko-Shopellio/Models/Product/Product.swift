//
//  Product.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct Product: Reviewable, Discountable, Identifiable {
  let id = UUID()
  let title: String
  let imageUrls: [String]
  let subcategoryId: String

  let price: Decimal
  let discount: Decimal

  let stock: [StockItem]
  let sizes: [String]
  let colors: [String]

  let overview: String?
  let careInstruction: String?
  let reviews: [Review]

  let keywords: [String] // for search, filters, seo
  let tags: [String] // new, sells fast, customer choice, ...

  // other possible characteristics: materials, oversized, high/low waist, ...

  init(title: String, imageUrls: [String] = [], subcategoryId: String, price: Decimal, discount: Decimal = 0.0, stock: [StockItem] = [], sizes: [String] = [], colors: [String] = [], overview: String? = nil, careInstruction: String? = nil, reviews: [Review] = [], keywords: [String] = [], tags: [String] = []) {
    self.title = title
    self.imageUrls = imageUrls
    self.subcategoryId = subcategoryId
    self.price = price
    self.discount = discount
    self.stock = stock
    self.sizes = sizes
    self.colors = colors
    self.overview = overview
    self.careInstruction = careInstruction
    self.reviews = reviews
    self.keywords = keywords
    self.tags = tags
  }
}

protocol Discountable {
  var discount: Decimal { get }
  var discountedPrice: Decimal { get }
  var discountLabel: String { get }
}

extension Product {
  var discountedPrice: Decimal {
    price - price * discount
  }

  var discountLabel: String {
    "\(discount * 100)%"
  }
}

extension Product: Hashable, Equatable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: Product, rhs: Product) -> Bool {
    lhs.id == rhs.id
  }
}