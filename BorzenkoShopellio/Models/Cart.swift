//
//  Cart.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct CartItem: Identifiable, Codable {
  let id: UUID
  let product: Product
  let variant: ProductVariant
  var quantity: Int

  init(id: UUID = UUID(), product: Product, variant: ProductVariant, quantity: Int) {
    self.id = id
    self.product = product
    self.variant = variant
    self.quantity = quantity
  }

  enum CodingKeys: CodingKey {
    case id
    case product
    case variant
    case quantity
  }
}

class Cart: ObservableObject {
  static let cartJsonURL = URL(filePath: "CartData", relativeTo: URL.documentsDirectory).appendingPathExtension("json")

  @Published private(set) var items: [CartItem] {
    didSet {
      saveToFile()
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
    guard FileManager.default.fileExists(atPath: Cart.cartJsonURL.path) else {
      items = []
      return
    }

    let decoder = JSONDecoder()
    do {
      let cartData = try Data(contentsOf: Cart.cartJsonURL)
      items = try decoder.decode([CartItem].self, from: cartData)
    } catch let error {
      print(error)
      items = []
    }
  }

  private func saveToFile() {
    // assignment 4
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    do {
      let cartData = try encoder.encode(items)
      try cartData.write(to: Cart.cartJsonURL, options: .atomicWrite)
    } catch let error {
      print(error)
    }
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
