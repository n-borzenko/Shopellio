//
//  CartTestCase.swift
//  BorzenkoShopellioTests
//
//  Created by Natalia Borzenko on 25/03/2023.
//

// swiftlint:disable function_body_length type_body_length

import XCTest
@testable import BorzenkoShopellio

final class CartTestCase: XCTestCase {
  let product1 = Product(
    title: "Basic trench coat with belt",
    imageUrls: [],
    subcategoryId: "coats",
    price: 129.0,
    discount: 0.0,
    stock: [
      StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
      StockItem(variant: ProductVariant(color: "beige", size: "M"), level: .low)
    ],
    sizes: ["S", "M", "L"],
    colors: ["beige", "black"],
    tags: ["new"]
  )

  let product2 = Product(
    title: "Faux leather oversize jacket",
    imageUrls: [],
    subcategoryId: "coats",
    price: 95.0,
    discount: 0.05,
    stock: [
      StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
      StockItem(variant: ProductVariant(color: "black", size: "XXL"), level: .normal)
    ],
    sizes: ["M", "L", "XL", "XXL"],
    colors: ["black"]
  )

  // MARK: - calculations for the cart with several different items
  func testCartWithSeveralDifferentItems() throws {
    let variant1Quantity = 1
    let variant2Quantity = 2
    let variant3Quantity = 1
    let variant4Quantity = 3

    let items = [
      CartItem(product: product1, variant: product1.stock[0].variant, quantity: variant1Quantity),
      CartItem(product: product1, variant: product1.stock[1].variant, quantity: variant2Quantity),
      CartItem(product: product2, variant: product2.stock[0].variant, quantity: variant3Quantity),
      CartItem(product: product2, variant: product2.stock[1].variant, quantity: variant4Quantity)
    ]

    let cart = Cart(items: items)
    XCTAssertEqual(
      cart.items.count,
      items.count,
      "Cart should contain \(items.count) product variants, but it contains \(cart.items.count)"
    )

    let totalCount = variant1Quantity + variant2Quantity + variant3Quantity + variant4Quantity
    XCTAssertEqual(
      cart.totalItemQuantity,
      totalCount,
      "Cart should contain \(totalCount) items in total, but it contains \(cart.totalItemQuantity)"
    )

    let totalAmount = product1.price * Decimal(variant1Quantity + variant2Quantity) +
    product2.price * (1 - product2.discount) * Decimal(variant3Quantity + variant4Quantity)
    XCTAssertEqual(
      cart.totalAmount,
      totalAmount,
      "Cart total amount with applied discount should be \(totalAmount), but it is \(cart.totalAmount)"
    )

    let totalAmountBeforeDiscount = product1.price * Decimal(variant1Quantity + variant2Quantity) +
      product2.price * Decimal(variant3Quantity + variant4Quantity)
    XCTAssertEqual(
      cart.totalAmountBeforeDiscount,
      totalAmountBeforeDiscount,
      "Cart total before discount should be \(totalAmountBeforeDiscount), but it is \(cart.totalAmountBeforeDiscount)"
    )

    let discountedAmount = product2.price * product2.discount * Decimal(variant3Quantity + variant4Quantity)
    XCTAssertEqual(
      cart.discountedAmount,
      discountedAmount,
      "Discounted amount should be \(discountedAmount), but it is \(cart.discountedAmount)"
    )
  }

  // MARK: - adding products to the cart
  func testAddingProductsToTheCart() throws {
    let variant1 = product1.stock[0].variant
    let variant2 = product1.stock[1].variant
    let variant3 = product2.stock[0].variant
    var quantity: Int

    let cart = Cart()
    XCTAssertTrue(cart.items.isEmpty, "Cart should be empty, but it is not")
    XCTAssertEqual(
      cart.getItemQuantity(product: product1, variant: variant1),
      0,
      "Empty cart should not contain any products, but it contains \(product1.title)"
    )

    cart.addProduct(product: product1, variant: variant1)
    XCTAssertEqual(cart.items.count, 1, "Cart should contain 1 product variant, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      1,
      "Cart should contain 1 item in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant1)
    XCTAssertEqual(
      quantity,
      1,
      "The quantity of the first variant of the first product should be equal to 1, but it is \(quantity)"
    )

    cart.addProduct(product: product1, variant: variant2)
    XCTAssertEqual(cart.items.count, 2, "Cart should contain 2 product variants, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      2,
      "Cart should contain 2 items in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant1)
    XCTAssertEqual(
      quantity,
      1,
      "The quantity of the first variant of the first product should be equal to 1, but it is \(quantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant2)
    XCTAssertEqual(
      quantity,
      1,
      "The quantity of the second variant of the first product should be equal to 1, but it is \(quantity)"
    )

    cart.addProduct(product: product1, variant: variant1)
    XCTAssertEqual(cart.items.count, 2, "Cart should contain 2 product variants, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      3,
      "Cart should contain 3 items in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant1)
    XCTAssertEqual(
      quantity,
      2,
      "The quantity of the first variant of the first product should be equal to 2, but it is \(quantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant2)
    XCTAssertEqual(
      quantity,
      1,
      "The quantity of the second variant of the first product should be equal to 1, but it is \(quantity)"
    )

    cart.addProduct(product: product2, variant: variant3)
    XCTAssertEqual(cart.items.count, 3, "Cart should contain 3 product variants, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      4,
      "Cart should contain 4 items in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant1)
    XCTAssertEqual(
      quantity,
      2,
      "The quantity of the first variant of the first product should be equal to 2, but it is \(quantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant2)
    XCTAssertEqual(
      quantity,
      1,
      "The quantity of the second variant of the first product should be equal to 1, but it is \(quantity)"
    )
    quantity = cart.getItemQuantity(product: product2, variant: variant3)
    XCTAssertEqual(
      quantity,
      1,
      "The quantity of the first variant of the second product should be equal to 1, but it is \(quantity)"
    )
  }

  // MARK: - removing products from the cart by variant
  func testRemovingProductsFromTheCartByVariant() throws {
    let variant1 = product1.stock[0].variant
    let variant2 = product1.stock[1].variant
    let variant3 = product2.stock[0].variant
    var quantity: Int

    let cart = Cart(items: [
      CartItem(product: product1, variant: variant1, quantity: 2),
      CartItem(product: product1, variant: variant2, quantity: 1),
      CartItem(product: product2, variant: variant3, quantity: 1)
    ])
    XCTAssertEqual(cart.items.count, 3, "Cart should contain 3 product variants, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      4,
      "Cart should contain 4 items in total, but it contains \(cart.totalItemQuantity)"
    )

    cart.removeProduct(product: product1, variant: variant1)
    XCTAssertEqual(cart.items.count, 3, "Cart should contain 3 product variants, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      3,
      "Cart should contain 3 items in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant1)
    XCTAssertEqual(
      quantity,
      1,
      "The quantity of the first variant of the first product should be equal to 1, but it is \(quantity)"
    )

    cart.removeProduct(product: product1, variant: variant2)
    XCTAssertEqual(cart.items.count, 2, "Cart should contain 2 product variants, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      2,
      "Cart should contain 2 items in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant2)
    XCTAssertEqual(
      quantity,
      0,
      "The quantity of the second variant of the first product should be equal to 0, but it is \(quantity)"
    )

    cart.removeProduct(product: product1, variant: variant1)
    XCTAssertEqual(cart.items.count, 1, "Cart should contain 1 product variant, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      1,
      "Cart should contain 1 item in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant1)
    XCTAssertEqual(
      quantity,
      0,
      "The quantity of the first variant of the first product should be equal to 0, but it is \(quantity)"
    )

    cart.removeProduct(product: product2, variant: variant3)
    XCTAssertTrue(cart.items.isEmpty, "Cart should be empty, but it is not")
    XCTAssertEqual(
      cart.totalItemQuantity,
      0,
      "Cart should not contain any items, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product2, variant: variant3)
    XCTAssertEqual(
      quantity,
      0,
      "The quantity of the first variant of the second product should be equal to 0, but it is \(quantity)"
    )

    XCTAssertNoThrow(
      cart.removeProduct(product: product2, variant: variant3),
      "There should be no effect on the cart if there is no such a product variant"
    )
  }

  // MARK: - removing products from the cart one by offset
  func testRemovingProductsFromTheCartByOffset() throws {
    let variant1 = product1.stock[0].variant
    let variant2 = product1.stock[1].variant
    let variant3 = product2.stock[0].variant
    var quantity: Int

    let cart = Cart(items: [
      CartItem(product: product1, variant: variant1, quantity: 2),
      CartItem(product: product1, variant: variant2, quantity: 1),
      CartItem(product: product2, variant: variant3, quantity: 2)
    ])
    XCTAssertEqual(cart.items.count, 3, "Cart should contain 3 product variants, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      5,
      "Cart should contain 5 items in total, but it contains \(cart.totalItemQuantity)"
    )

    cart.removeItems(atOffsets: IndexSet(integersIn: 1...2))
    XCTAssertEqual(cart.items.count, 1, "Cart should contain 1 product variant, but it contains \(cart.items.count)")
    XCTAssertEqual(
      cart.totalItemQuantity,
      2,
      "Cart should contain 2 items in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant1)
    XCTAssertEqual(
      quantity,
      2,
      "The quantity of the first variant of the first product should be equal to 2, but it is \(quantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant2)
    XCTAssertEqual(
      quantity,
      0,
      "The quantity of the second variant of the first product should be equal to 0, but it is \(quantity)"
    )
    quantity = cart.getItemQuantity(product: product2, variant: variant3)
    XCTAssertEqual(
      quantity,
      0,
      "The quantity of the first variant of the second product should be equal to 0, but it is \(quantity)"
    )

    cart.removeItems(atOffsets: IndexSet(integer: 1))
    XCTAssertEqual(
      cart.items.count,
      1,
      "Cart should still contain 1 product variant, but it contains \(cart.items.count)"
    )
    XCTAssertEqual(
      cart.totalItemQuantity,
      2,
      "Cart should still contain 2 items in total, but it contains \(cart.totalItemQuantity)"
    )
    quantity = cart.getItemQuantity(product: product1, variant: variant1)
    XCTAssertEqual(
      quantity,
      2,
      "The quantity of the first variant of the first product should still be equal to 2, but it is \(quantity)"
    )

    cart.removeItems(atOffsets: IndexSet(integer: 0))
    XCTAssertTrue(cart.items.isEmpty, "Cart should be empty, but it is not")
  }
}
