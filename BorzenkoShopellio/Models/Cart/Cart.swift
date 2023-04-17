//
//  Cart.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

class Cart: ObservableObject {
  @Published private(set) var items: [CartItem] {
    didSet {
      saveItems()
    }
  }

  var totalItemQuantity: Int {
    items.reduce(0) { $0 + $1.quantity }
  }

  var totalAmount: Decimal {
    items.reduce(Decimal(0.0)) { $0 + $1.product.discountedPrice * Decimal($1.quantity) }
  }

  var totalAmountBeforeDiscount: Decimal {
    items.reduce(Decimal(0.0)) { $0 + $1.product.price * Decimal($1.quantity) }
  }

  var discountedAmount: Decimal {
    totalAmountBeforeDiscount - totalAmount
  }

  init(items: [CartItem]) {
    self.items = items
  }

  init() {
    do {
      self.items = try Cache.shared.readFromFile(for: .cartItems)
    } catch {
      self.items = []
    }
  }

  private func saveItems() {
    do {
      try Cache.shared.saveToFile(items, for: .cartItems)
    } catch { }
  }
}

// MARK: - Operations with cart items
extension Cart {
  private func getItemIndex(product: Product, variant: ProductVariant) -> Int? {
    items.firstIndex { $0.product.id == product.id && $0.variant == variant }
  }

  func addProduct(product: Product, variant: ProductVariant) {
    let index = getItemIndex(product: product, variant: variant)
    if let index = index {
      items[index].quantity += 1
    } else {
      items.append(CartItem(product: product, variant: variant, quantity: 1))
    }
  }

  func removeProduct(product: Product, variant: ProductVariant) {
    let index = getItemIndex(product: product, variant: variant)
    if let index = index {
      if items[index].quantity > 1 {
        items[index].quantity -= 1
      } else {
        items.remove(at: index)
      }
    }
  }

  func removeItems(atOffsets offsets: IndexSet) {
    items.remove(atOffsets: offsets)
  }

  func getItemQuantity(product: Product, variant: ProductVariant) -> Int {
    let index = getItemIndex(product: product, variant: variant)
    guard let index = index else { return 0 }
    return items[index].quantity
  }
}
