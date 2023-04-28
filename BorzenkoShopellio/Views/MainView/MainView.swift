//
//  MainView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct MainView: View {
  @StateObject private var router = Router()
  @StateObject private var cart = Cart()
  @StateObject private var shop: Shop
  @StateObject private var products: Products
  @State private var isInitialLoading = true

  init() {
    let shop = Shop()
    _shop = StateObject(wrappedValue: { shop }())
    _products = StateObject(wrappedValue: { Products(shop: shop) }() )
  }

  var body: some View {
    ZStack {
      Color.backgroundColor
        .ignoresSafeArea()

      if shop.state == .finished && products.state == .finished {
        MainTabView()
          .environmentObject(cart)
          .environmentObject(shop)
          .environmentObject(products)
          .environmentObject(router)
      } else {
        if isInitialLoading {
          MainLoadingView()
        } else {
          ErrorStateView(
            isLoading: shop.state == .loading || products.state == .loading,
            state: .requestError,
            action: fetchAndCache
          )
        }
      }
    }
    .task {
      await withTaskGroup(of: Void.self) { group in
        group.addTask { await shop.getCachedOrFetch() }
        group.addTask { await products.getCachedOrFetch() }
        group.addTask { await cart.getCachedItems() }
      }
      isInitialLoading = false
    }
  }

  private func fetchAndCache() {
    Task {
      await withTaskGroup(of: Void.self) { group in
        group.addTask { await shop.fetchAndCache() }
        group.addTask { await products.fetchAndCache() }
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
