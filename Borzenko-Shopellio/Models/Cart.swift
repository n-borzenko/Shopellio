//
//  Cart.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 06/03/2023.
//

import Foundation

// for now, the basic option for discounts is the most preferable
// as far as the API has not been revealed and it's not clear if there should be separate discounts for different products,
// group discounts like "3 items from some category for 10$" etc.
let discounts: [String: Decimal] = [
  "Default": 0.05,
  "Boxing Day": 0.1,
  "Cyber Monday": 0.2,
  "Black Friday": 0.25,
  "Shop Birthday": 0.3
]

// cart item is a basic structure with a small amount of possible changes (e.g. just count)
struct CartItem {
  let product: Product
  var count: Int
}

// a complex class that allows handling different changes in the cart content and several calculations
class Cart: ObservableObject {
  @Published var items: [CartItem] = []
  @Published var discountType: String?

  var totalAmount: Decimal {
    items.reduce(0) { $0 + $1.product.price * Decimal($1.count) }
  }

  var discount: Decimal {
    guard let discountType = discountType else {
      return 0
    }
    return discounts[discountType] ?? 0
  }

  var currentDiscountedAmount: Decimal {
    let discountedAmount = totalAmount * discount
    return totalAmount - discountedAmount
  }

  init(items: [CartItem], discountType: String = "Default") {
    self.items = items
    self.discountType = discountType
  }

  func addProduct(product: Product) {
    let index = items.firstIndex { $0.product.id == product.id }
    if let index = index {
      items[index].count += 1
    } else {
      items.append(CartItem(product: product, count: 1))
    }
  }

  func removeProduct(product: Product) {
    let index = items.firstIndex { $0.product.id == product.id }
    if let index = index {
      if items[index].count > 1 {
        items[index].count -= 1
      } else {
        items.remove(at: index)
      }
    }
  }

  func getItemCount(product: Product) -> Int {
    let index = items.firstIndex { $0.product.id == product.id }
    if let index = index {
      return items[index].count
    } else {
      return 0
    }
  }
}
