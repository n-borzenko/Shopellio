//
//  Constants.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import Foundation

enum Constants {
  enum General {
    static let welcomeTextKerning = 1.4
    static let headlineTextLineSpacing = 6.0

    static let unavailableString = "n/a"
    static let doneAction = "Done"
  }

  enum Home {
    static let navigationTitle = "Products"
  }

  enum About {
    static let navigationTitle = "About"
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

    static let navigationTitle = "Cart content"
    static let totalTitle = "Total:"
    static let discount = "Current discount"
    static let totalAfterDiscountTitle = "Total amount after discount:"
  }
}
