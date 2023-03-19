//
//  Cart.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct CartItem {
  let product: Product
  let variant: ProductVariant
  var count: Int
}

class Cart: ObservableObject {
  @Published var items: [CartItem] = []

  var totalItemCount: Int {
    items.reduce(0) { $0 + $1.count }
  }

  var totalAmount: Decimal {
    items.reduce(Decimal(0.0)) { $0 + $1.product.discountedPrice * Decimal($1.count) }
  }

  var totalAmountBeforeDiscount: Decimal {
    items.reduce(Decimal(0.0)) { $0 + $1.product.price * Decimal($1.count) }
  }

  var discountedAmount: Decimal {
    totalAmount - totalAmountBeforeDiscount
  }
}

// operations with cart items
extension Cart {
  private func getItemIndex(product: Product, variant: ProductVariant) -> Int? {
    items.firstIndex { $0.product.id == product.id && $0.variant == variant }
  }

  func addProduct(product: Product, variant: ProductVariant) {
    let index = getItemIndex(product: product, variant: variant)
    if let index = index {
      items[index].count += 1
    } else {
      items.append(CartItem(product: product, variant: variant, count: 1))
    }
  }

  func removeProduct(product: Product, variant: ProductVariant) {
    let index = getItemIndex(product: product, variant: variant)
    if let index = index {
      if items[index].count > 1 {
        items[index].count -= 1
      } else {
        items.remove(at: index)
      }
    }
  }

  func getItemCount(product: Product, variant: ProductVariant) -> Int {
    let index = getItemIndex(product: product, variant: variant)
    if let index = index {
      return items[index].count
    } else {
      return 0
    }
  }
}
