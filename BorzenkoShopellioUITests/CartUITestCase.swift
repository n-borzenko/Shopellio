//
//  CartUITestCase.swift
//  BorzenkoShopellioUITests
//
//  Created by Natalia Borzenko on 26/03/2023.
//

// swiftlint:disable overridden_super_call function_body_length

import XCTest

final class CartUITestCase: XCTestCase {
  override func setUpWithError() throws {continueAfterFailure = false
  }

  func testCartEdition() throws {
    let app = XCUIApplication()
    app.launch()


  }
}
