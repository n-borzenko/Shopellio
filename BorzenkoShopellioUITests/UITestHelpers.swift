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

  static func deleteTheApp() {
    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")

    XCUIApplication().terminate()

    let icon = springboard.otherElements["Home screen icons"].icons["Shopellio"]
    if icon.exists {
      icon.press(forDuration: 1)

      let buttonRemoveApp = springboard.buttons["Remove App"]
      if buttonRemoveApp.waitForExistence(timeout: 3) {
        buttonRemoveApp.tap()
      } else {
        XCTFail("Button \"Remove App\" not found")
      }

      let buttonDeleteApp = springboard.alerts.buttons["Delete App"]
      if buttonDeleteApp.waitForExistence(timeout: 3) {
        buttonDeleteApp.tap()
      } else {
        XCTFail("Button \"Delete App\" not found")
      }

      let buttonDelete = springboard.alerts.buttons["Delete"]
      if buttonDelete.waitForExistence(timeout: 5) {
        buttonDelete.tap()
      } else {
        XCTFail("Button \"Delete\" not found")
      }
    }
  }
}
