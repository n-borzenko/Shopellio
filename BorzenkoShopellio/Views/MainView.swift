//
//  MainView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct MainTabView: View {
  @State private var selectedTab = Constants.Main.newArrivalsTitle
  @EnvironmentObject var cart: Cart

  var body: some View {
    TabView(selection: $selectedTab) {
      NewArrivalsView()
        .tabItem {
          Image.flame
          Text(Constants.Main.newArrivalsTitle)
        }
        .tag(Constants.Main.newArrivalsTitle)
      ProductsView()
        .tabItem {
          Image.squareStack
          Text(Constants.Main.productsTitle)
        }
        .tag(Constants.Main.productsTitle)
      CartView()
        .tabItem {
          Image.cart
          Text(Constants.Main.cartTitle)
        }
        .badge(cart.totalItemQuantity > 0 ? "\(cart.totalItemQuantity)" : nil)
        .tag(Constants.Main.cartTitle)
      AboutView()
        .tabItem {
          Image.infoCircle
          Text(Constants.Main.aboutTitle)
        }
        .tag(Constants.Main.aboutTitle)
    }
  }
}

struct MainView: View {
  // shop settings data is expected to be loaded from the API
  // and shared throughout the application
  @StateObject private var shop = SampleData.shop
  @StateObject private var cart = Cart()

  var body: some View {
    MainTabView()
      .environmentObject(cart)
      .environmentObject(shop)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
