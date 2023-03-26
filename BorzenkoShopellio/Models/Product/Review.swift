//
//  Review.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct Review {
  let id: UUID
  let productVariant: ProductVariant
  let author: String?
  let imageUrls: [String]?
  let text: String?
  let rating: Int

  init(
    id: UUID = UUID(),
    productVariant: ProductVariant,
    author: String? = nil,
    imageUrls: [String]? = nil,
    text: String? = nil,
    rating: Int
  ) {
    self.id = id
    self.productVariant = productVariant
    self.author = author
    self.imageUrls = imageUrls
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
}
