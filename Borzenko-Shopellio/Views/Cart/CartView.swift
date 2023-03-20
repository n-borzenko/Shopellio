//
//  CartView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct CartView: View {
  @EnvironmentObject var cart: Cart

  var body: some View {
    NavigationStack {
      CartListView()
        .navigationDestination(for: Product.self) { product in
          ProductDetailsView(product: product)
        }
        .navigationTitle(Constants.Cart.navigationTitle)
        .toolbar {
          ToolbarItem(placement: .confirmationAction) {
            Button(Constants.Cart.checkoutButtonTitle) {}
              .disabled(true)
          }
        }
    }
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
      .environmentObject(SampleData.shop)
      .environmentObject(Cart(items: [
        CartItem(
          product: SampleData.products[0],
          variant: SampleData.products[0].stock[0].variant,
          count: 2
        )
      ]))
  }
}
