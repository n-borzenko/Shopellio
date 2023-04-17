//
//  CartItem.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 12/04/2023.
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
}
