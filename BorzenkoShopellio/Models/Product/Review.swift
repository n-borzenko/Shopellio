//
//  Review.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct Review {
  let productId: Int
  let productVariant: ProductVariant
  let id: Int
  let author: String?
  let imageUrls: [String]?
  let text: String?
  let rating: Int
}

protocol Reviewable {
  var reviews: [Review] { get }
}

extension Reviewable {
  var rating: Int {
    guard !reviews.isEmpty else {
      return 0
    }
    return reviews.reduce(0) { $0 + $1.rating } / reviews.count
  }
}
