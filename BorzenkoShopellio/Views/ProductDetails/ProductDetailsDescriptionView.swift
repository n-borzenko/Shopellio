//
//  ProductDetailsDescriptionView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 04/05/2023.
//

import SwiftUI

struct ProductDetailsDescriptionView: View {
  @Binding var isVariantSelectionShown: Bool
  var product: Product

  var body: some View {
    VStack(alignment: .leading) {
      Text(product.title)
        .titleStyle()
        .accessibilityIdentifier(Constants.Identifiers.productDetailsTitle)
      ProductPriceContainerView(product: product)
      HStack {
        Text(Constants.ProductDetails.colorsListLabel)
          .labelStyle()
        ScrollView(.horizontal) {
          ProductColorsView(colors: product.colors, isLimited: false)
        }
      }
      HStack {
        Text(Constants.ProductDetails.sizesListLabel)
          .labelStyle()
        ScrollView(.horizontal) {
          HStack {
            ForEach(product.sizes, id: \.self) { sizeName in
              ProductSizeLabel(sizeName: sizeName)
            }
          }
        }
      }
      if let overview = product.overview {
        Text(overview)
          .defaultStyle()
      }

      Divider()
      ProductDetailsDescriptionReviewsView(product: product)
    }
  }
}

struct ProductDetailsDescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      ProductDetailsDescriptionView(
        isVariantSelectionShown: .constant(false),
        product: SampleData.products.allItems[0]
      )
    }
    .environmentObject(SampleData.shop)
    .environmentObject(SampleData.emptyCart)
  }
}
