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
    let expectedValue = quantity > 0 ? "\(quantity) item\(quantity == 1 ? "" : "s")" : ""
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

  static func skipOnboarding() {
    let app = XCUIApplication()
    if app.buttons["Skip"].exists {
      app.buttons["Skip"].tap()
    }
  }

  static func emptyTheCart() throws {
    let app = XCUIApplication()
    let tabBar = app.tabBars["Tab Bar"]

    let badgeValue = try XCTUnwrap(
      tabBar.buttons["Cart"].value as? String,
      "Cart badge should be a string, but it is not"
    )
    guard !badgeValue.isEmpty else {
      return
    }

    tabBar.buttons["Cart"].tap()
    app.navigationBars["Cart"].buttons["Remove all"].tap()
    app.alerts["Empty the cart"].scrollViews.otherElements.buttons["Remove all"].tap()
    app.scrollViews.otherElements.buttons["Go shopping"].tap()
  }
}
