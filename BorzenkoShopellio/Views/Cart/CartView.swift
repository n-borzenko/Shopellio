//
//  CartView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct CartView: View {
  @EnvironmentObject var cart: Cart
  @EnvironmentObject var router: Router

  var body: some View {
    NavigationStack(path: $router.cartPath) {
      if cart.items.isEmpty {
        ErrorStateView(state: .emptyCart, actionTitle: "Go shopping") {}
        .navigationTitle(Constants.Cart.navigationTitle)
        .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
      } else {
        List {
          CartContentSectionView()
            .listRowBackground(Color.cellBackgroundColor)
          CartSummarySectionView()
            .listRowBackground(Color.cellBackgroundColor)
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.backgroundColor)
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
        .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
      }
    }
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
      .environmentObject(SampleData.shop)
      .environmentObject(SampleData.filledCart)
      .environmentObject(Router())
  }
}
