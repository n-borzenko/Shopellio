//
//  ProductVariantSelectionView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 24/03/2023.
//

import SwiftUI

struct ProductVariantSelectionView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var model = ProductVariantSelectionViewModel()
  let product: Product

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ProductColorSelectionView(
          colors: model.product?.colors ?? [],
          availableColors: model.availableColors,
          selectedColorName: $model.selectedColorName
        )
        ProductSizeSelectionView(
          sizes: model.product?.sizes ?? [],
          availableSizes: model.availableSizes,
          selectedSizeName: $model.selectedSizeName
        )
        Divider()
        ProductVariantSelectionFooterView(model: model)
      }
      .padding()
    }
    .background(Color.backgroundColor)
    .onAppear {
      model.product = product
    }
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Close") {
          dismiss()
        }
      }
    }
  }
}

struct ProductVariantSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    ProductVariantSelectionView(product: SampleData.products[8])
      .environmentObject(SampleData.shop)
      .environmentObject(Cart())
  }
}
