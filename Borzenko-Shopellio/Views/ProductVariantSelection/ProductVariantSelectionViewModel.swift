//
//  ProductVariantSelectionViewModel.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 24/03/2023.
//

import Foundation

class ProductVariantSelectionViewModel: ObservableObject {
  @Published var selectedColorName: String?
  @Published var selectedSizeName: String?
  @Published var product: Product?

  var availableColors: Set<String> {
    guard let product = product else { return Set() }
    if let selectedSize = selectedSizeName {
      return Set(
        product.stock
          .filter { $0.variant.size == selectedSize }
          .map { $0.variant.color }
      )
    } else {
      return Set(product.stock.map { $0.variant.color })
    }
  }

  var availableSizes: Set<String> {
    guard let product = product else { return Set() }
    if let selectedColor = selectedColorName {
      return Set(
        product.stock
          .filter { $0.variant.color == selectedColor }
          .map { $0.variant.size }
      )
    } else {
      return Set(product.stock.map { $0.variant.size })
    }
  }

  var selectedStockLevel: StockLevel? {
    guard
      let product = product,
      let selectedColor = selectedColorName,
      let selectedSize = selectedSizeName else {
      return nil
    }
    let item = product.stock.first { $0.variant.color == selectedColor && $0.variant.size == selectedSize }
    return item?.level ?? StockLevel.none
  }

  var selectedStockItem: StockItem? {
    guard
      let product = product,
      let selectedColor = selectedColorName,
      let selectedSize = selectedSizeName else {
      return nil
    }
    return product.stock.first { $0.variant.color == selectedColor && $0.variant.size == selectedSize }
  }

  var isSelectionAvailableToBuy: Bool {
    guard let item = selectedStockItem else {
      return false
    }
    return item.level != .none
  }
}
