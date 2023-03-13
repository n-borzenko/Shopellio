//
//  ProductView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 13/03/2023.
//

import SwiftUI

struct ProductView: View {
  @ObservedObject var cart: Cart
  var product: Product

  var body: some View {
    VStack(alignment: .center) {
      Rectangle()
        .fill(.white)
        .aspectRatio(Constants.General.imagesAspectRatio, contentMode: .fill)
        .overlay {
          AsyncImage(url: URL(string: product.imageURL)) { image in
            image
              .resizable()
              .scaledToFit()
          } placeholder: {
            ProgressView()
              .tint(.accentColor)
          }
        }
      Text(product.name)
        .headlineStyle()
        .lineLimit(Constants.Product.maxLineCount)
      Text(product.specification)
        .defaultStyle()
        .lineLimit(Constants.Product.maxLineCount)
    }
  }
}

struct ProductView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      ProductView(
        cart: Cart(items: [
          CartItem(product: ProductList.items[0], count: 1),
          CartItem(product: ProductList.items[3], count: 2)
        ]),
        product: ProductList.items[0]
      )
    }
  }
}
