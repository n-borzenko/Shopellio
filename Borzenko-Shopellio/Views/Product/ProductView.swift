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
        .aspectRatio(3 / 4, contentMode: .fill)
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
        .lineLimit(2)
      Text(product.specification)
        .defaultStyle()
        .lineLimit(2)
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
