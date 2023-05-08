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
  @State private var emptyCartAlertIsShown = false

  var body: some View {
    NavigationStack(path: $router.cartPath) {
      if cart.items.isEmpty {
        ErrorStateView(
          state: .emptyCart,
          actionTitle: Constants.Cart.emptyCartButtonTitle
        ) {
          router.selectedTab = .products
        }
        .navigationTitle(Constants.Cart.navigationTitle)
        .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
      } else {
        List {
          CartSummarySectionView()
            .listRowBackground(Color.cellBackgroundColor)
          CartContentSectionView()
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
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(Constants.Cart.checkoutButtonTitle) {}
              .disabled(true)
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Button(Constants.Cart.removeAllButtonTitle) {
              emptyCartAlertIsShown = true
            }
          }
        }
        .alert(
          Constants.Cart.removeAllAlertTitle,
          isPresented: $emptyCartAlertIsShown
        ) {
          Button(Constants.Cart.removeAllButtonTitle, role: .destructive) {
            cart.removeAllItems()
            emptyCartAlertIsShown = false
          }
          Button(Constants.Cart.cancelButtonTitle, role: .cancel) {
            emptyCartAlertIsShown = false
          }
        } message: {
          Text(Constants.Cart.removeAllAlertMessage)
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
