//
//  ProductVariantSelectionView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 24/03/2023.
//

import SwiftUI

struct ProductVariantSelectionView: View {
  @Environment(\.dismiss) var dismiss
  @State var selectedColorName: String?
  @State var selectedSizeName: String?
  let product: Product

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ProductColorSelectionView(
          colors: product.colors,
          availableColors: product.getAvailableColors(size: selectedSizeName),
          selectedColorName: $selectedColorName
        )
        ProductSizeSelectionView(
          sizes: product.sizes,
          availableSizes: product.getAvailableSizes(color: selectedColorName),
          selectedSizeName: $selectedSizeName
        )
        Divider()
        ProductVariantSelectionFooterView(
          selectedColorName: $selectedColorName,
          selectedSizeName: $selectedSizeName,
          product: product
        )
      }
      .padding()
    }
    .background(Color.backgroundColor)
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button(Constants.Product.closeButtonTitle) {
          dismiss()
        }
      }
    }
    .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
  }
}

struct ProductVariantSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    ProductVariantSelectionView(product: SampleData.products.allItems[2])
      .environmentObject(SampleData.shop)
      .environmentObject(SampleData.emptyCart)
  }
}
