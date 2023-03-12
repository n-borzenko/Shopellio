//
//  ProductListView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 27/02/2023.
//

import SwiftUI

struct ProductListView: View {
  @ObservedObject var cart: Cart
  @State private var hideUncategorizedItems = false

  var products: [Product] {
    hideUncategorizedItems ? ProductList.items.filter { $0.category != nil } : ProductList.items
  }

  var body: some View {
    ScrollView {
      VStack(spacing: Constants.Product.listVerticalSpacing) {
        HStack {
          ProductCartButton(cart: cart)
          Spacer(minLength: Constants.Product.horizontalActionsSpacing)
          Toggle(isOn: $hideUncategorizedItems) {
            TextView(text: Constants.Product.toggleLabel)
          }
          .tint(.accentColor)
        }
        ForEach(products) { product in
          ProductListItemView(cart: cart, product: product)
        }
      }
      .padding()
    }
  }
}

struct ProductCartButton: View {
  @State private var cartIsShown = false
  @ObservedObject var cart: Cart

  var body: some View {
    Button(action: {
      cartIsShown = true
    }, label: {
      ImageCircleView(systemName: Constants.Images.cartCircle)
    })
    .sheet(isPresented: $cartIsShown, onDismiss: {}, content: {
      CartView(cartIsShown: $cartIsShown, cart: cart)
    })
  }
}

struct ProductListView_Previews: PreviewProvider {
  static var previews: some View {
    ProductListView(cart: Cart(items: [
      CartItem(product: ProductList.items[0], count: 1),
      CartItem(product: ProductList.items[3], count: 2)
    ]))
  }
}
