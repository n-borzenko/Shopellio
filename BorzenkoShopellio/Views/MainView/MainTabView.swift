//
//  MainTabView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 17/04/2023.
//

import SwiftUI

struct MainTabView: View {
  @EnvironmentObject var cart: Cart
  @EnvironmentObject var router: Router

  var body: some View {
    TabView(selection: $router.selectedTab) {
      NewArrivalsView()
        .tabItem {
          Image.flame
          Text(Constants.Main.newArrivalsTitle)
        }
        .tag(MainTab.newArrivals)
      ProductsView()
        .tabItem {
          Image.squareStack
          Text(Constants.Main.productsTitle)
        }
        .tag(MainTab.products)
      CartView()
        .tabItem {
          Image.cart
          Text(Constants.Main.cartTitle)
        }
        .badge(cart.totalItemQuantity > 0 ? "\(cart.totalItemQuantity)" : nil)
        .tag(MainTab.cart)
      AboutView()
        .tabItem {
          Image.infoCircle
          Text(Constants.Main.aboutTitle)
        }
        .tag(MainTab.about)
    }
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
      .environmentObject(SampleData.filledCart)
      .environmentObject(SampleData.shop)
      .environmentObject(SampleData.products)
      .environmentObject(Router())
  }
}
