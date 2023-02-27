//
//  Constants.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import Foundation

enum Constants {
  enum General {
    public static let circularButtonWidth = CGFloat(40.0)
    public static let circularButtonHeight = CGFloat(40.0)
    public static let buttonGradientOpacity = CGFloat(0.3)

    public static let welcomeTextKerning = CGFloat(1.4)
    public static let headlineTextLineSpacing = CGFloat(6.0)
  }

  enum Images {
    public static let logoLarge = "LogoLarge"
    public static let infoCircle = "info.circle"
    public static let emptyCircle = "circle"
    public static let checkmarkCircle = "checkmark.circle"
    public static let xmarkCircle = "xmark.circle"
    public static let star = "star"
    public static let starFill = "star.fill"
  }

  enum Home {
    public static let verticalSpacing = CGFloat(20.0)

    public static let username = "Natalia Borzenko"
    public static let welcomeText = "Welcome,\n \(Constants.Home.username)."
  }

  enum Onboarding {
    public static let verticalSpacing = CGFloat(20.0)
    public static let featureListSpacing = CGFloat(10.0)

    public static let headlineText = "Shopellio is an online shop " +
      "where you can buy a huge variety of different products that can fit anyone's needs. " +
      "User-friendly interface will help you navigate easily and choose the best item possible in almost one touch. " +
      "Please, enjoy the application and share your experience and thoughts!"
    public static let footnoteText = "This app is a prototype of the Capstone project for Kodeco iOS Bootcamp 2023."
    public static let listTitle = "Planned feature list"
  }

  enum Product {
    public static let borderWidth = CGFloat(2.0)
    public static let cornerRadius = CGFloat(8.0)
    public static let listVerticalSpacing = CGFloat(20.0)

    public static let maxRating = 5

    public static let priceFormat = "%.2f$"
    public static let reviews = "Reviews:"
    public static let toggleLabel = "Hide items without category"
  }
}
