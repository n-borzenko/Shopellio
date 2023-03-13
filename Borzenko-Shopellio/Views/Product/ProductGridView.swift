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
  let columns = Array.init(repeating: GridItem(.adaptive(minimum: 160)), count: 2)

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
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
