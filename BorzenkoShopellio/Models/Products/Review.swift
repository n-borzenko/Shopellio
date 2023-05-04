//
//  Review.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct Review: Codable, Identifiable {
  let id: UUID
  let productVariant: ProductVariant
  let text: String?
  let rating: Int

  init(
    id: UUID = UUID(),
    productVariant: ProductVariant,
    text: String? = nil,
    rating: Int
  ) {
    self.id = id
    self.productVariant = productVariant
    self.text = text
    self.rating = rating
  }
}

protocol Reviewable {
  var reviews: [Review] { get }
}

extension Reviewable {
  var rating: Double {
    guard !reviews.isEmpty else {
      return 0
    }
    return Double(reviews.reduce(0) { $0 + $1.rating }) / Double(reviews.count)
  }

  func getRatingString() -> String {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 1
    return formatter.string(for: rating) ?? Constants.General.unavailableString
  }
}
