//
//  Router.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 17/04/2023.
//

import SwiftUI

class Router: ObservableObject {
  @Published var newArrivalsPath = NavigationPath()
  @Published var productsPath = NavigationPath()
  @Published var cartPath = NavigationPath()

  @Published var selectedTab = MainTab.newArrivals {
    didSet {
      if oldValue == selectedTab {
        popToRoot(tab: selectedTab)
      }
    }
  }

  private func popToRoot(tab: MainTab) {
    switch tab {
    case .newArrivals: newArrivalsPath.removeLast(newArrivalsPath.count)
    case .products: productsPath.removeLast(productsPath.count)
    case .cart: cartPath.removeLast(cartPath.count)
    default: return
    }
  }
}

enum MainTab {
  case newArrivals
  case products
  case cart
  case about
}
