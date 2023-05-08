//
//  Cart.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

@MainActor
final class Cart: ObservableObject {
  private let cache: Cacher

  @Published private(set) var items: [CartItem] {
    didSet {
      Task {
        await saveItems()
      }
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

  init(items: [CartItem] = [], cache: Cacher = Cache.shared) {
    self.cache = cache
    self.items = items
  }

  func getCachedItems() async {
    do {
      items = try await cache.readFromFile(for: .cartItems)
    } catch {}
  }

  private func saveItems() async {
    do {
      try await cache.saveToFile(items, for: .cartItems)
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

  func removeAllItems() {
    items.removeAll()
  }

  func getItemQuantity(product: Product, variant: ProductVariant) -> Int {
    let index = getItemIndex(product: product, variant: variant)
    guard let index = index else { return 0 }
    return items[index].quantity
  }
}
