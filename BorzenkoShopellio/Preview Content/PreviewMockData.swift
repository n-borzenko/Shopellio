//
//  PreviewMockData.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 12/04/2023.
//

import Foundation

@MainActor
enum SampleData {
  static let shop = Shop(
    colors: [
      "beige": "#F5F5DC",
      "white": "#FFFFFF",
      "black": "#000000",
      "red": "#FF0000",
      "blue": "#0000FF",
      "green": "#00FF00",
      "gray": "#808080",
      "navy blue": "#000080",
      "steel blue": "#4682B4",
      "baby pink": "#F4C2C2",
      "burgundy": "#800020",
      "brown": "#964B00",
      "silver": "#C0C0C0"
    ]
  )

  static let products = Products(
    shop: SampleData.shop,
    products: [
      Product(
        title: "Basic trench coat with belt",
        imageUrls: ["https://images.unsplash.com/photo-1651491646869-3f18f4d30be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80"],
        subcategoryId: "coats",
        price: 129.0,
        discount: 0.0,
        stock: [
          StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
          StockItem(variant: ProductVariant(color: "beige", size: "M"), level: .low),
          StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
          StockItem(variant: ProductVariant(color: "beige", size: "L"), level: .normal),
          StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low)
        ],
        sizes: ["S", "M", "L"],
        colors: ["beige", "black"],
        overview: "Trench coat made of a cotton blend fabric. Lapel collar and long sleeves with tabs." +
        " Front welt pockets. Back vent at the hem, Double breasted button fastening",
        tags: ["new"]
      ),
      Product(
        title: "Faux leather oversize jacket",
        imageUrls: ["https://images.unsplash.com/photo-1511280303142-0051e93baeeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80"],
        subcategoryId: "coats",
        price: 95.0,
        discount: 0.05,
        stock: [
          StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
          StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
          StockItem(variant: ProductVariant(color: "black", size: "XXL"), level: .normal)
        ],
        sizes: ["M", "L", "XL", "XXL"],
        colors: ["black"]
      ),
      Product(
        title: "Basic T-shirt",
        imageUrls: ["https://images.unsplash.com/photo-1562157873-818bc0726f68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80"],
        subcategoryId: "t-shirts",
        price: 15.0,
        discount: 0.0,
        stock: [
          StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
          StockItem(variant: ProductVariant(color: "white", size: "M"), level: .normal),
          StockItem(variant: ProductVariant(color: "white", size: "L"), level: .low),
          StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
          StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
          StockItem(variant: ProductVariant(color: "black", size: "L"), level: .normal),
          StockItem(variant: ProductVariant(color: "gray", size: "S"), level: .low),
          StockItem(variant: ProductVariant(color: "gray", size: "M"), level: .normal),
          StockItem(variant: ProductVariant(color: "gray", size: "L"), level: .normal),
          StockItem(variant: ProductVariant(color: "red", size: "S"), level: .low),
          StockItem(variant: ProductVariant(color: "red", size: "M"), level: .normal),
          StockItem(variant: ProductVariant(color: "red", size: "L"), level: .normal),
          StockItem(variant: ProductVariant(color: "blue", size: "S"), level: .low),
          StockItem(variant: ProductVariant(color: "blue", size: "M"), level: .normal),
          StockItem(variant: ProductVariant(color: "blue", size: "L"), level: .normal),
          StockItem(variant: ProductVariant(color: "green", size: "S"), level: .low),
          StockItem(variant: ProductVariant(color: "green", size: "L"), level: .normal)
        ],
        sizes: ["XS", "S", "M", "L", "XL", "XXL", "3XL", "4XL", "5XL"],
        colors: ["white", "black", "gray", "navy blue", "red", "blue", "green"],
        overview: "A basic T-shirt made of soft cotton fabric. Round neckline and short sleeves.",
        tags: ["new"]
      )
    ]
  )
  static let filledCart = Cart(items: [
    CartItem(
      product: SampleData.products.allItems[0],
      variant: SampleData.products.allItems[0].stock[3].variant,
      quantity: 2
    ),
    CartItem(
      product: SampleData.products.allItems[1],
      variant: SampleData.products.allItems[1].stock[2].variant,
      quantity: 1
    )
  ])
  static let emptyCart = Cart(items: [])
}
