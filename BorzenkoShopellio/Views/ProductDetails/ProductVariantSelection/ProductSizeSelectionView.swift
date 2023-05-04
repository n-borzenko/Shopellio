//
//  ProductSizeSelectionView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 24/03/2023.
//

import SwiftUI

struct ProductSizeSelectionView: View {
  var sizes: [String]
  var availableSizes: Set<String>
  @Binding var selectedSizeName: String?

  let gridColumns = [
    GridItem(
      .adaptive(minimum: Constants.ProductDetails.sizesMinColumnWidth),
      spacing: Constants.ProductDetails.sizesGridSpacing
    )
  ]

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        if let size = selectedSizeName {
          Text(Constants.ProductDetails.sizeLabel)
            .defaultStyle()
          ProductSizeLabel(sizeName: size)
        } else {
          Text(Constants.ProductDetails.selectSizeLabel)
            .defaultStyle()
        }
      }

      LazyVGrid(columns: gridColumns, spacing: Constants.ProductDetails.sizesGridSpacing) {
        ForEach(sizes, id: \.self) { size in
          Button {
            selectedSizeName = size
          } label: {
            ProductSizeLabel(
              sizeName: size,
              scale: .large,
              isUnavailable: !availableSizes.contains(size),
              isLimited: false
            )
            .padding(Constants.ProductDetails.sizeCornerRadiusOffset + Constants.ProductDetails.selectionBorderWidth)
            .frame(maxWidth: .infinity)
            .overlay(
              (selectedSizeName ?? "") == size ?
              RoundedRectangle(
                cornerRadius: Constants.Product.sizeLabelLargeCornerRadius +
                Constants.ProductDetails.sizeCornerRadiusOffset
              )
              .strokeBorder(lineWidth: Constants.ProductDetails.selectionBorderWidth)
              : nil
            )
          }
        }
      }
    }
  }
}

struct ProductSizeSelectionView_Previews: PreviewProvider {
  static let product = SampleData.products.allItems[2]

  static var previews: some View {
    ProductSizeSelectionView(
      sizes: product.sizes,
      availableSizes: Set(
        product
          .stock
          .filter { $0.variant.color == "green" }
          .map { $0.variant.size }
      ),
      selectedSizeName: .constant(product.stock[5].variant.size)
    )
    .environmentObject(SampleData.shop)
  }
}
