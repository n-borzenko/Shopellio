//
//  NewArrivalsUITestCase.swift
//  BorzenkoShopellioUITests
//
//  Created by Natalia Borzenko on 26/03/2023.
//

// swiftlint:disable overridden_super_call function_body_length

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
    guard let cartBadgeValue = app.tabBars["Tab Bar"].buttons["Cart"].value as? String else {
      XCTFail("Cart badge value should a string, but it is not")
      return
    }
    XCTAssertEqual(cartBadgeValue, "", "Cart badge should not exist, but the the value is \(cartBadgeValue)")

    // default segmented control selection
    XCTAssertTrue(
      navigationBar.segmentedControls.buttons["Women"].isSelected,
      "Women category should be selected by default, but it is not"
    )

    // first item for women is a trench with an image
    let firstItem = app.scrollViews.otherElements.buttons.element(boundBy: 0)
    XCTAssertEqual(
      firstItem.label,
      "Basic trench coat with belt, £129.00, NEW",
      "First item should be \"Basic trench coat with belt\", but it is \(firstItem.label)"
    )
    XCTAssertEqual(
      firstItem.images.count,
      1,
      "First item should contain 1 image, but it contains \(firstItem.images.count)"
    )

    // select men category
    // swiftlint:disable:next line_length
    navigationBar/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Men"]/*[[".segmentedControls.buttons[\"Men\"]",".buttons[\"Men\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
    XCTAssertTrue(
      navigationBar.segmentedControls.buttons["Men"].isSelected,
      "Men category should be selected after tapping on it, but it is not"
    )

    // select an item for men
    let tShirtItem = app.scrollViews.otherElements.buttons["Printed t-shirt with pocket, £18.00, NEW"]
    XCTAssertTrue(
      tShirtItem.isHittable,
      "Printed t-shirt with pocket should be available for selection, but it is not"
    )
    tShirtItem.tap()

    // check navigation to details view and it's title
    let detailsTitle = app.scrollViews.staticTexts["Product Details Title"]
    XCTAssertEqual(
      detailsTitle.label,
      "Printed t-shirt with pocket",
      "Detail view should contain title \"Printed t-shirt with pocket\", but it is \(detailsTitle.label)"
    )

    // open variant selection and select one
    detailsTitle.swipeUp()
    app.scrollViews.buttons["Select variant"].tap()
    app.scrollViews.buttons["black"].tap()
    app.scrollViews.buttons["M"].tap()

    // add variant to the cart
    let addButton = app.scrollViews.buttons["Add items"]
    XCTAssertTrue(addButton.isEnabled, "Variant is selected, add to cart button should be available, but it is not")
    addButton.tap()
    if !app.tabBars["Tab Bar"].buttons["Cart"].waitForExistence(timeout: 2) {
      XCTFail("Cart tab bar item should appear in 2 seconds, but it doesn't")
    }

    // check updated cart badge
    guard let cartBadgeValue2 = app.tabBars["Tab Bar"].buttons["Cart"].value as? String else {
      XCTFail("Cart badge value should a string, but it is not")
      return
    }
    XCTAssertEqual(
      cartBadgeValue2,
      "1 item",
      "Cart badge should be equal to 1, but it is \(cartBadgeValue2)"
    )
  }
}
