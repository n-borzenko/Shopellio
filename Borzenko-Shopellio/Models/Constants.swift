//
//  Constants.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import Foundation

enum Constants {
  enum General {
    static let circularButtonWidth = 40.0
    static let circularButtonHeight = 40.0
    static let buttonGradientOpacity = 0.3

    static let welcomeTextKerning = 1.4
    static let headlineTextLineSpacing = 6.0

    static let unavailableString = "n/a"
  }

  enum Home {
    static let verticalSpacing = 20.0

    static let username = "Natalia Borzenko"
    static let welcomeText = "Welcome,\n \(Constants.Home.username)."
  }

  enum Onboarding {
    static let verticalSpacing = 20.0
    static let featureListSpacing = 10.0

    static let headlineText = "Shopellio is an online shop " +
      "where you can buy a huge variety of different products that can fit anyone's needs. " +
      "User-friendly interface will help you navigate easily and choose the best item possible in almost one touch. " +
      "Please, enjoy the application and share your experience and thoughts!"
    static let footnoteText = "This app is a prototype of the Capstone project for Kodeco iOS Bootcamp 2023."
    static let listTitle = "Planned feature list"
  }

  enum Product {
    static let borderWidth = 2.0
    static let cornerRadius = 8.0
    static let listVerticalSpacing = 20.0
    static let horizontalActionsSpacing = 40.0

    static let maxRating = 5

    static let reviews = "Reviews:"
    static let toggleLabel = "Hide items without category"
    static let cartContentLabel = "In the cart:"
    static let addToCartLabel = "Add to cart"
  }

  enum Cart {
    static let verticalSpacing = 20.0
    static let itemListSpacing = 10.0

    static let listTitle = "Cart content"
    static let totalTitle = "Total:"
    static let discount = "Current discount"
    static let totalAfterDiscountTitle = "Total amount after discount:"
  }
}
