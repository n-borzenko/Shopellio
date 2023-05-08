//
//  NewArrivalsUITestCase.swift
//  BorzenkoShopellioUITests
//
//  Created by Natalia Borzenko on 26/03/2023.
//

// swiftlint:disable overridden_super_call

import XCTest

final class NewArrivalsUITestCase: XCTestCase {
  override func setUpWithError() throws {
    continueAfterFailure = false
  }

  // MARK: - New Arrivals collection and default TabView settings
  func testMenTShirtSelection() throws {
    let app = XCUIApplication()
    app.launch()

    UITestHelpers.skipOnboarding()

    if !app.navigationBars["Products"].waitForExistence(timeout: 5) {
      XCTFail("Products tab should have appeared in 2 seconds, but it didn't")
    }

    // default tab view selection
    var navigationBar = app.navigationBars["Products"]
    XCTAssertTrue(
      navigationBar.staticTexts["Products"].exists,
      "Products screen should be selected by default, but it is not"
    )

    try UITestHelpers.emptyTheCart()

    // empty cart badge
    try UITestHelpers.checkCartBadge(quantity: 0)

    let scrollViews = app.scrollViews
    scrollViews.otherElements.buttons["New Arrivals"].tap()

    // default picker selection
    navigationBar = app.navigationBars["New Arrivals"]
    XCTAssertTrue(
      navigationBar.buttons["All"].isSelected,
      "All categories should be selected by default, but it is not"
    )

    if !scrollViews.buttons["Basic trench coat with belt, $129.00, NEW"].waitForExistence(timeout: 4) {
      XCTFail("Products grid should have appeared in 4 seconds, but it didn't")
    }

    // first item for all categories is a trench with an image
    let firstItem = scrollViews.buttons.element(boundBy: 0)
    XCTAssertEqual(
      firstItem.label,
      "Basic trench coat with belt, $129.00, NEW",
      "First item should be \"Basic trench coat with belt\", but it is \(firstItem.label)"
    )

    // select men category
    navigationBar.buttons["Men"].tap()
    XCTAssertTrue(
      navigationBar.buttons["Men"].isSelected,
      "Men category should be selected after tapping on it, but it is not"
    )

    // select an item for men
    let tShirtItem = scrollViews.otherElements.buttons["Printed t-shirt with pocket, $18.00, NEW"]
    XCTAssertTrue(
      tShirtItem.isHittable,
      "Printed t-shirt with pocket should be available for selection, but it is not"
    )
    tShirtItem.tap()

    // check navigation to details view and it's title
    let detailsTitle = scrollViews.staticTexts["Product details title"]
    XCTAssertEqual(
      detailsTitle.label,
      "Printed t-shirt with pocket",
      "Detail view should contain title \"Printed t-shirt with pocket\", but it is \(detailsTitle.label)"
    )

    // open variant selection and select one
    detailsTitle.swipeUp()
    app.navigationBars.buttons["Add to cart"].tap()
    scrollViews.buttons["black"].tap()
    scrollViews.buttons["M"].tap()

    // add variant to the cart
    let addButton = app.scrollViews.buttons["Add to cart"]
    XCTAssertTrue(addButton.isEnabled, "Variant is selected, add to cart button should be available, but it is not")
    addButton.tap()
    if !app.tabBars["Tab Bar"].waitForExistence(timeout: 2) {
      XCTFail("Tab bar should have appeared in 2 seconds, but it didn't")
    }

    // check updated cart badge
    try UITestHelpers.checkCartBadge(quantity: 1)
  }
}
