//
//  ProductGridView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductGridView: View {
  var products: [Product]
  private let columns = [
    GridItem(.adaptive(
      minimum: Constants.NewArrivals.gridItemMinWidth,
      maximum: Constants.NewArrivals.gridItemMaxWidth
    ))
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(products) { product in
          NavigationLink(value: product) {
            ProductCellView(product: product)
              .aspectRatio(
                Constants.NewArrivals.cellAspectRatio,
                contentMode: .fit
              )
          }
        }
      }
      .padding([.horizontal, .bottom])
    }
    .scrollContentBackground(.hidden)
    .background(Color.backgroundColor)
  }
}

struct ProductCellView: View {
  var product: Product

  var body: some View {
    VStack(alignment: .leading) {
      ProductImageView(imageUrl: product.imageUrls.first)
      Divider()
      VStack(alignment: .leading) {
        Text(product.title)
          .defaultStyle()
          .lineLimit(Constants.Products.titleRowLineLimit)
        HStack {
          ProductPriceTextView(product: product)
          if product.tags.contains(Constants.General.newArrivalTag) {
            ProductTagView(product: product)
          }
        }
        ProductColorsView(product: product)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .padding(Constants.NewArrivals.cellPadding)
    .background(Color.invertedContrastColor)
    .clipShape(RoundedRectangle(cornerRadius: Constants.NewArrivals.cellCornerRadius))
  }
}

struct ProductGridView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ProductGridView(products: SampleData.products)
    }
    .environmentObject(SampleData.shop)
  }
}
