//
//  FeatureList.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import Foundation

struct Feature: Hashable {
  let title: String
  let implemented: Bool

  init(title: String, implemented: Bool = false) {
    self.title = title
    self.implemented = implemented
  }

  static func == (lhs: Feature, rhs: Feature) -> Bool {
    return lhs.title == rhs.title && lhs.implemented == rhs.implemented
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
    hasher.combine(implemented)
  }
}

enum FeatureList {
  public static let content = [
    Feature(title: "Home and Onboarding screens", implemented: true),
    Feature(title: "List of available items fetched from the API"),
    Feature(title: "Detailed item page"),
    Feature(title: "Shopping cart"),
    Feature(title: "Checkout page with option to apply the discount code"),
    Feature(title: "Order history"),
    Feature(title: "Review of purchased items with text description and photo"),
    Feature(title: "Shareable whishlists")
  ]
}
