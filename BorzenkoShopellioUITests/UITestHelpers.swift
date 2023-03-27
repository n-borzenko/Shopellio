//
//  UITestHelpers.swift
//  BorzenkoShopellioUITests
//
//  Created by Natalia Borzenko on 27/03/2023.
//

import XCTest

enum UITestHelpers {
  static func checkCartBadge(quantity: Int) throws {
    let tabBar = XCUIApplication().tabBars["Tab Bar"]
    let expectedValue = quantity > 0 ? "\(quantity) items" : ""
    try compareStringValue(item: tabBar.buttons["Cart"], title: "Cart badge value", value: expectedValue)
  }

  static func compareStringValue(item: XCUIElement, title: String, value expectedValue: String) throws {
    XCTAssertTrue(item.exists, "\(title) should be visible, but it isn't")
    let visibleValue = try XCTUnwrap(
      item.value as? String,
      "\(title) should be a string, but it is not"
    )

    XCTAssertEqual(
      visibleValue,
      expectedValue,
      "\(title) should be equal to \"\(expectedValue)\", but it is \(visibleValue)"
    )
  }
}
