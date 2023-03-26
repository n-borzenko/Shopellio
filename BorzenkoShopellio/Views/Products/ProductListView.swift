//
//  ProductListView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductListView: View {
  var products: [Product]

  var body: some View {
    List(products) { product in
      NavigationLink(value: product) {
        ProductsRowView(product: product)
      }
      .alignmentGuide(.listRowSeparatorLeading) { _ in
        return 0
      }
    }
    .listStyle(.insetGrouped)
    .scrollContentBackground(.hidden)
    .background(Color.backgroundColor)
  }
}

struct ProductsRowView: View {
  var product: Product

  var body: some View {
    HStack(alignment: .top) {
      ProductImageView(imageUrl: product.imageUrls.first)
        .frame(
          width: Constants.Products.productRowHeight,
          height: Constants.Products.productRowHeight
        )

      VStack(alignment: .leading) {
        Text(product.title)
          .defaultStyle()
          .lineLimit(Constants.Products.titleRowLineLimit)
        HStack {
          ProductPriceContainerView(product: product)
          if product.tags.contains(Constants.Product.newArrivalTag) {
            ProductTagView(tag: Constants.Product.newArrivalTag)
          }
        }
        ProductColorsView(colors: product.colors)
      }
    }
    .frame(maxHeight: Constants.Products.productRowHeight)
  }
}


struct ProductListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ProductListView(products: SampleData.products)
    }
    .environmentObject(SampleData.shop)
  }
}
