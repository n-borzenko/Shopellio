//
//  Stock.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct ProductVariant: Equatable {
  let color: String
  let size: String

  static func ==(lhs: ProductVariant, rhs: ProductVariant) -> Bool {
    return lhs.color == rhs.color && lhs.size == rhs.size
  }
}

enum StockLevel: String {
  case low = "Low availability"
  case normal = "In stock"

  var color: Color {
    switch self {
    case .low: return .orange
    case .normal: return .green
    }
  }
}

struct StockItem {
  let variant: ProductVariant
  let level: StockLevel
}
