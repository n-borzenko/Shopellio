//
//  CartView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct CartView: View {
  @EnvironmentObject var cart: Cart

  var body: some View {
    NavigationStack {
      List {
        if !cart.items.isEmpty {
          CartContentSectionView()
        }
        CartSummarySectionView()
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
    }
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
      .environmentObject(SampleData.shop)
      .environmentObject(SampleData.filledCart)
  }
}
