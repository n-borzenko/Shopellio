//
//  Product.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct Product: Reviewable, Discountable {
  let id: Int
  let title: String
  let imageUrls: [String]
  let subcategoryId: Int

  let price: Decimal
  let discount: Decimal = 0.0

  let stock: [StockItem]
  let sizes: [String]
  let colors: [String]

  let overview: String?
  let careInstruction: String?
  let reviews: [Review]?

  let keywords: [String] // for search, filters, seo
  let tags: [Int] // new, sells fast, customer choice, ...

  // other possible characteristics: materials, oversized, high/low waist, ...
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
