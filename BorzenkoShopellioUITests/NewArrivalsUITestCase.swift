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

  // MARK: - New Arrivals screen and default TabView settings
  func testMenTShirtSelection() throws {
    // UI tests must launch the application that they test.
    let app = XCUIApplication()
    app.launch()

    // default tab view selection
    let navigationBar = app.navigationBars["New Arrivals"]
    XCTAssertTrue(
      navigationBar.staticTexts["New Arrivals"].exists,
      "New arrivals screen should be selected by default, but it is not"
    )

    // empty cart badge
    try UITestHelpers.checkCartBadge(quantity: 0)

    // default segmented control selection
    let segmentedControls = navigationBar.segmentedControls
    XCTAssertTrue(
      segmentedControls.buttons["Women"].isSelected,
      "Women category should be selected by default, but it is not"
    )

    // first item for women is a trench with an image
    let scrollViews = app.scrollViews
    let firstItem = scrollViews.buttons.element(boundBy: 0)
    XCTAssertEqual(
      firstItem.label,
      "Basic trench coat with belt, $129.00, NEW",
      "First item should be \"Basic trench coat with belt\", but it is \(firstItem.label)"
    )
    XCTAssertEqual(
      firstItem.images.count,
      1,
      "First item should contain 1 image, but it contains \(firstItem.images.count)"
    )

    // select men category
    segmentedControls.buttons["Men"].tap()
    XCTAssertTrue(
      segmentedControls.buttons["Men"].isSelected,
      "Men category should be selected after tapping on it, but it is not"
    )

    // select an item for men
    let tShirtItem = scrollViews.buttons["Printed t-shirt with pocket, $18.00, NEW"]
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
    scrollViews.buttons["Select variant"].tap()
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
