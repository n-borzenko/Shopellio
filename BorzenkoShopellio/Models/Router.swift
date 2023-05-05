//
//  Router.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 17/04/2023.
//

import SwiftUI

@MainActor
final class Router: ObservableObject {
  static private let onboardingWasShownKey = "OnboardingWasShown"

  @Published var productsPath = NavigationPath()
  @Published var cartPath = NavigationPath()

  @Published var onboardingWasShown = false {
    didSet {
      UserDefaults.standard.set(onboardingWasShown, forKey: Router.onboardingWasShownKey)
    }
  }

  @Published var selectedTab = MainTab.products {
    didSet {
      if oldValue == selectedTab {
        popToRoot(tab: selectedTab)
      }
    }
  }

  init() {
    self.onboardingWasShown = UserDefaults.standard.bool(forKey: Router.onboardingWasShownKey)
  }

  private func popToRoot(tab: MainTab) {
    switch tab {
    case .products: productsPath.removeLast(productsPath.count)
    case .cart: cartPath.removeLast(cartPath.count)
    default: return
    }
  }
}

enum MainTab {
  case products
  case cart
  case about
}
