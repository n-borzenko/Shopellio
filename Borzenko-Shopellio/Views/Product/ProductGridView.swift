//
//  ProductGridView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 13/03/2023.
//

import SwiftUI

struct ProductGridView: View {
  @ObservedObject var cart: Cart
  var products: [Product] = ProductList.items
  let columns = Array.init(
    repeating: GridItem(.adaptive(minimum: Constants.Product.gridColumnMinWidth)),
    count: Constants.Product.gridColumnsCount
  )

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: Constants.Product.gridVerticalSpacing) {
        ForEach(products) { product in
          NavigationLink(destination: ProductDetailView(cart: cart, product: product)) {
            ProductView(cart: cart, product: product)
          }
        }
      }
      .padding(.horizontal)
    }
  }
}

struct ProductGridView_Previews: PreviewProvider {
  static var previews: some View {
    ProductGridView(cart: Cart(items: [
      CartItem(product: ProductList.items[0], count: 1),
      CartItem(product: ProductList.items[3], count: 2)
    ]))
  }
}
