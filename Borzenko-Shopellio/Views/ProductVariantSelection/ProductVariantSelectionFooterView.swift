//
//  ProductVariantSelectionFooterView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 24/03/2023.
//

import SwiftUI

struct ProductVariantSelectionFooterView: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var cart: Cart
  @ObservedObject var model: ProductVariantSelectionViewModel
  @State private var isAddingToCart = false

  var buttonTextColor: Color? {
    let staticColor = model.isSelectionAvailableToBuy ? Color.invertedContrastColor : nil
    return isAddingToCart ? .accentColor : staticColor
  }

  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      if let level = model.selectedStockLevel {
        Label(level.rawValue, systemImage: level.imageName)
          .foregroundColor(level.color)
      }
      Spacer()
      Button {
        if
          let product = model.product,
          let variant = model.selectedStockItem?.variant {
          isAddingToCart = true
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
      .disabled(!model.isSelectionAvailableToBuy)
      .buttonStyle(.borderedProminent)
    }
  }
}

struct ProductVariantSelectionFooterView_Previews: PreviewProvider {
  static var previews: some View {
    let model = ProductVariantSelectionViewModel()
    ProductVariantSelectionFooterView(model: model)
      .environmentObject(Cart())
      .onAppear {
        model.product = SampleData.products[8]
        model.selectedSizeName = "M"
        model.selectedColorName = "blue"
      }
  }
}
