//
//  Product.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct Product: Reviewable, Discountable, Identifiable, Codable {
  let id: UUID
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

  init(id: UUID = UUID(), title: String, imageUrls: [String] = [], subcategoryId: String, price: Decimal, discount: Decimal = 0.0, stock: [StockItem] = [], sizes: [String] = [], colors: [String] = [], overview: String? = nil, careInstruction: String? = nil, reviews: [Review] = [], keywords: [String] = [], tags: [String] = []) {
    self.id = id
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

  enum CodingKeys: CodingKey {
    case id
    case title
    case imageUrls
    case subcategoryId
    case price
    case discount
    case stock
    case sizes
    case colors
    case overview
    case careInstruction
    case reviews
    case keywords
    case tags
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
    Product.percentFormatter.string(for: discount) ?? Constants.General.unavailableString
  }
}

extension Product {
  static private var currencyFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
  }()

  static private let percentFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    return formatter
  }()

  static func getPriceString(_ price: Decimal) -> String {
    return currencyFormatter.string(for: price) ?? Constants.General.unavailableString
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

extension Product {
  func getAvailableColors(size: String? = nil) -> Set<String> {
    var filteredStockItems: [StockItem]
    if let size = size {
      filteredStockItems = stock.filter { $0.variant.size == size && $0.level != .none }
    } else {
      filteredStockItems = stock.filter { $0.level != .none }
    }
    return Set(filteredStockItems.map { $0.variant.color })
  }

  func getAvailableSizes(color: String? = nil) -> Set<String> {
    var filteredStockItems: [StockItem]
    if let color = color {
      filteredStockItems = stock.filter { $0.variant.color == color && $0.level != .none }
    } else {
      filteredStockItems = stock.filter { $0.level != .none }
    }
    return Set(filteredStockItems.map { $0.variant.size })
  }
}
