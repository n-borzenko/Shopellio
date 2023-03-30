//
//  ProductTestCase.swift
//  BorzenkoShopellioTests
//
//  Created by Natalia Borzenko on 26/03/2023.
//

import XCTest
@testable import BorzenkoShopellio

final class ProductTestCase: XCTestCase {
  let product1 = Product(
    title: "Basic T-shirt",
    imageUrls: [],
    subcategoryId: "t-shirts",
    price: 15.0,
    discount: 0.05,
    stock: [
      StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
      StockItem(variant: ProductVariant(color: "white", size: "M"), level: .none),
      StockItem(variant: ProductVariant(color: "white", size: "L"), level: .low),
      StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
      StockItem(variant: ProductVariant(color: "black", size: "M"), level: .none),
      StockItem(variant: ProductVariant(color: "black", size: "L"), level: .none),
      StockItem(variant: ProductVariant(color: "gray", size: "S"), level: .none),
      StockItem(variant: ProductVariant(color: "gray", size: "M"), level: .none)
    ],
    sizes: ["XS", "S", "M", "L"],
    colors: ["white", "black", "gray", "green"]
  )

  let product2 = Product(
    title: "Printed t-shirt with pocket",
    imageUrls: [],
    subcategoryId: "t-shirts",
    price: 18.0,
    discount: 0.0,
    stock: [
      StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
      StockItem(variant: ProductVariant(color: "white", size: "M"), level: .none)
    ],
    sizes: ["S", "M"],
    colors: ["white"],
    reviews: [
      Review(productVariant: ProductVariant(color: "white", size: "S"), rating: 5),
      Review(productVariant: ProductVariant(color: "white", size: "S"), rating: 4),
      Review(productVariant: ProductVariant(color: "white", size: "M"), rating: 4)
    ]
  )

  // MARK: - checking discounted price
  func testDiscountedProductPrice() throws {
    let discountedPrice = product1.price - product1.price * product1.discount
    XCTAssertEqual(
      product1.discountedPrice,
      discountedPrice,
      "Product discounted price should be \(discountedPrice), but it is \(product1.discountedPrice)"
    )

    XCTAssertEqual(
      product2.discountedPrice,
      product2.price,
      "Product discounted price should be \(product2.price), but it is \(product2.discountedPrice)"
    )
  }

  // MARK: - checking rating calculation
  func testProductRatingCalculation() throws {
    XCTAssertEqual(product1.rating, 0.0, "Product rating should be 0.0, but it is \(product1.rating)")

    let expectedRating = (5.0 + 4.0 + 4.0) / 3.0
    XCTAssertEqual(
      product2.rating,
      expectedRating,
      "Product discounted price should be \(expectedRating), but it is \(product2.rating)"
    )
  }

  // MARK: - getting available colors for the product
  func testAvailableColorsForTheProduct() throws {
    var colors = product1.getAvailableColors()
    XCTAssertEqual(colors.count, 2, "2 colors should be available for purchase, but got \(colors.count)")
    XCTAssertTrue(colors.contains("white"), "White color should be available for purchase, but it is not")
    XCTAssertTrue(colors.contains("black"), "Black color should be available for purchase, but it is not")

    colors = product1.getAvailableColors(size: "XS")
    XCTAssertEqual(colors.count, 0, "No colors should be available for size XS, but got \(colors.count)")
    colors = product1.getAvailableColors(size: "S")
    XCTAssertEqual(colors.count, 2, "2 colors should be available for size S, but got \(colors.count)")
    colors = product1.getAvailableColors(size: "M")
    XCTAssertEqual(colors.count, 0, "No colors should be available for size M, but got \(colors.count)")
    colors = product1.getAvailableColors(size: "L")
    XCTAssertEqual(colors.count, 1, "1 color should be available for size L, but got \(colors.count)")
  }

  // MARK: - getting available sizes for the product
  func testAvailableSizesForTheProduct() throws {
    var sizes = product1.getAvailableSizes()
    XCTAssertEqual(sizes.count, 2, "2 sizes should be available for purchase, but got \(sizes.count)")
    XCTAssertTrue(sizes.contains("S"), "Size S should be available for purchase, but it is not")
    XCTAssertTrue(sizes.contains("L"), "Size L should be available for purchase, but it is not")

    sizes = product1.getAvailableSizes(color: "white")
    XCTAssertEqual(sizes.count, 2, "2 sizes should be available for white color, but got \(sizes.count)")
    sizes = product1.getAvailableSizes(color: "black")
    XCTAssertEqual(sizes.count, 1, "1 size should be available for black color, but got \(sizes.count)")
    sizes = product1.getAvailableSizes(color: "gray")
    XCTAssertEqual(sizes.count, 0, "No sizes should be available for gray color, but got \(sizes.count)")
    sizes = product1.getAvailableSizes(color: "green")
    XCTAssertEqual(sizes.count, 0, "No sizes should be available for green color, but got \(sizes.count)")
  }
}
