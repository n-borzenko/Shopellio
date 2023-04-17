//
//  ProductGroup.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 12/04/2023.
//

import Foundation

protocol ProductGroup: Equatable, Hashable {
  var id: String { get }
  var title: String { get }
}

extension ProductGroup {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: any ProductGroup, rhs: any ProductGroup) -> Bool {
    guard type(of: lhs) == type(of: rhs) else { return false }
    return lhs.id == rhs.id && lhs.title == rhs.title
  }
}

struct ProductCollection: ProductGroup, Identifiable, Codable {
  let id: String
  let title: String
}

struct ProductCategory: ProductGroup, Identifiable, Codable {
  let id: String
  let title: String
  let subcategories: [ProductSubcategory]

  static func == (lhs: ProductCategory, rhs: ProductCategory) -> Bool {
    return lhs.id == rhs.id &&
    lhs.title == rhs.title &&
    lhs.subcategories.count == rhs.subcategories.count
  }
}

struct ProductSubcategory: Identifiable, Codable {
  let id: String
  let title: String
}
