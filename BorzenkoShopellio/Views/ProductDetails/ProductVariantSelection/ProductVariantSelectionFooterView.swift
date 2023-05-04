//
//  ProductVariantSelectionFooterView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 24/03/2023.
//

import SwiftUI

struct ProductVariantSelectionFooterView: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var cart: Cart
  @State private var isAddingToCart = false
  @Binding var selectedColorName: String?
  @Binding var selectedSizeName: String?
  let product: Product

  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      if let level = currentStockLevel {
        Label(level.rawValue, systemImage: level.imageName)
          .foregroundColor(level.color)
      }
      Spacer()
      Button {
        if let variant = selectedStockItem?.variant {
          isAddingToCart = true
          Task {
            try await Task.sleep(for: .seconds(0.5))
            cart.addProduct(product: product, variant: variant)
            isAddingToCart = false
            dismiss()
          }
        }
      } label: {
        Text(Constants.ProductDetails.addToCartButtonTitle)
          .foregroundColor(buttonTextColor)
          .overlay(
            isAddingToCart ?
            ProgressView()
              .tint(.invertedContrastColor) : nil
          )
      }
      .disabled(!isSelectionAvailableToBuy)
      .buttonStyle(.borderedProminent)
    }
  }
}

extension ProductVariantSelectionFooterView {
  var buttonTextColor: Color? {
    let staticColor = isSelectionAvailableToBuy ? Color.invertedContrastColor : nil
    return isAddingToCart ? .accentColor : staticColor
  }

  var currentStockLevel: StockLevel? {
    guard
      let selectedColor = selectedColorName,
      let selectedSize = selectedSizeName else {
      return nil
    }
    let item = product.stock.first { $0.variant.color == selectedColor && $0.variant.size == selectedSize }
    return item?.level ?? StockLevel.none
  }

  var selectedStockItem: StockItem? {
    guard
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

struct ProductVariantSelectionFooterView_Previews: PreviewProvider {
  static var previews: some View {
    ProductVariantSelectionFooterView(
      selectedColorName: .constant("blue"),
      selectedSizeName: .constant("M"),
      product: SampleData.products.allItems[2]
    )
    .environmentObject(SampleData.emptyCart)
  }
}
