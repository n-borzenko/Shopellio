//
//  SampleData.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

// TODO: delete when data is available from API

enum SampleData {
  static let shop = Shop(
    colors: [
      "beige": "#F5F5DC",
      "white": "#FFFFFF",
      "black": "#000000",
      "red": "#FF0000",
      "navy blue": "#000080",
      "steel blue": "#4682B4",
      "baby pink": "#F4C2C2"
    ],
    sizes: ["One size", "XS", "S", "M", "L", "XL", "XXL", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
    categories: [
      "women": ProductCategory(id: "women", title: "Women", subcategoryIds: ["coats", "tops", "dresses", "trousers", "w_shoes", "accessories"]),
      "men": ProductCategory(id: "men", title: "Men", subcategoryIds: ["t-shirts", "m_jeans", "suits"])
    ],
    orderedCategoryIds: ["women", "men"],
    subcategories: [
      "coats": ProductSubcategory(id: "coats", title: "Coats & Jackets", categoryId: "women"),
      "tops": ProductSubcategory(id: "tops", title: "Tops", categoryId: "women"),
      "dresses": ProductSubcategory(id: "dresses", title: "Dresses", categoryId: "women"),
      "trousers": ProductSubcategory(id: "trousers", title: "Trousers & Leggings", categoryId: "women"),
      "w_shoes": ProductSubcategory(id: "w_shoes", title: "Shoes", categoryId: "women"),
      "accessories": ProductSubcategory(id: "accessories", title: "Accessories", categoryId: "women"),
      "suits": ProductSubcategory(id: "suits", title: "Suits", categoryId: "men"),
      "m_jeans": ProductSubcategory(id: "m_jeans", title: "Jeans", categoryId: "men"),
      "t-shirts": ProductSubcategory(id: "t-shirts", title: "T-shirts", categoryId: "men")
    ]
  )

  static let products = [
    Product(
      title: "Basic trench coat with belt",
      imageUrls: [],
      subcategoryId: "coats",
      price: 129.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "beige", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "beige", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
      ],
      sizes: ["S", "M", "L"],
      colors: ["beige", "black"],
      overview: "Trench coat made of a cotton blend fabric. Lapel collar and long sleeves with tabs. Front welt pockets. Back vent at the hem, Double breasted button fastening",
      tags: ["new"]
    ),
    Product(
      title: "Faux leather oversize jacket",
      imageUrls: [],
      subcategoryId: "coats",
      price: 95.0,
      discount: 0.05,
      stock: [
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "XXL"), level: .normal),
      ],
      sizes: ["M", "L", "XL", "XXL"],
      colors: ["black"]
    ),
    Product(
      title: "Mini dress with floral print",
      imageUrls: [],
      subcategoryId: "dresses",
      price: 32.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "baby pink", size: "XS"), level: .normal),
        StockItem(variant: ProductVariant(color: "baby pink", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "baby pink", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "XS"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "M"), level: .low),
      ],
      sizes: ["XS", "S", "M"],
      colors: ["baby pink", "white"],
      tags: ["new"]
    ),
    Product(
      title: "Puff shoulder pencil dress",
      imageUrls: [],
      subcategoryId: "dresses",
      price: 55.0,
      discount: 0.2,
      stock: [
        StockItem(variant: ProductVariant(color: "navy blue", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "navy blue", size: "L"), level: .low),
      ],
      sizes: ["S", "M", "L"],
      colors: ["navy blue"]
    ),
    Product(
      title: "Multi pocket cargo trouser",
      imageUrls: [],
      subcategoryId: "trousers",
      price: 35.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "beige", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "beige", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
      ],
      sizes: ["S", "M", "L"],
      colors: ["beige", "black"],
      tags: ["new"]
    ),
    Product(
      title: "Black trainers for running",
      imageUrls: [],
      subcategoryId: "w_shoes",
      price: 0.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "4", size: ""), level: .low),
        StockItem(variant: ProductVariant(color: "5", size: ""), level: .normal),
        StockItem(variant: ProductVariant(color: "6", size: ""), level: .low),
        StockItem(variant: ProductVariant(color: "7", size: ""), level: .normal),
      ],
      sizes: ["4", "5", "6", "7"],
      colors: ["black"],
      tags: []
    ),
    Product(
      title: "Regular fit suit",
      imageUrls: [],
      subcategoryId: "suits",
      price: 129.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "S", size: "black"), level: .low),
        StockItem(variant: ProductVariant(color: "S", size: "navy blue"), level: .normal),
        StockItem(variant: ProductVariant(color: "M", size: "navy blue"), level: .normal),
        StockItem(variant: ProductVariant(color: "L", size: "black"), level: .low),
        StockItem(variant: ProductVariant(color: "L", size: "navy blue"), level: .normal),
        StockItem(variant: ProductVariant(color: "XL", size: "black"), level: .normal),
        StockItem(variant: ProductVariant(color: "XL", size: "navy blue"), level: .normal),
      ],
      sizes: ["S", "M", "L", "XL"],
      colors: ["black", "navy blue"],
      tags: ["new"]
    ),
    Product(
      title: "Regular fit round-neck t-shirt",
      imageUrls: [],
      subcategoryId: "t-shirts",
      price: 15.0,
      discount: 0.05,
      stock: [
        StockItem(variant: ProductVariant(color: "S", size: "white"), level: .low),
        StockItem(variant: ProductVariant(color: "S", size: "black"), level: .normal),
        StockItem(variant: ProductVariant(color: "S", size: "red"), level: .low),
        StockItem(variant: ProductVariant(color: "S", size: "steel blue"), level: .normal),
        StockItem(variant: ProductVariant(color: "M", size: "white"), level: .low),
        StockItem(variant: ProductVariant(color: "M", size: "black"), level: .low),
        StockItem(variant: ProductVariant(color: "M", size: "steel blue"), level: .normal),
        StockItem(variant: ProductVariant(color: "L", size: "white"), level: .low),
        StockItem(variant: ProductVariant(color: "L", size: "black"), level: .low),
        StockItem(variant: ProductVariant(color: "L", size: "red"), level: .normal),
        StockItem(variant: ProductVariant(color: "L", size: "steel blue"), level: .low),
        StockItem(variant: ProductVariant(color: "XL", size: "white"), level: .normal),
        StockItem(variant: ProductVariant(color: "XL", size: "black"), level: .normal),
        StockItem(variant: ProductVariant(color: "XL", size: "red"), level: .normal),
        StockItem(variant: ProductVariant(color: "XL", size: "steel blue"), level: .low),
        StockItem(variant: ProductVariant(color: "XXL", size: "white"), level: .normal),
        StockItem(variant: ProductVariant(color: "XXL", size: "black"), level: .low),
        StockItem(variant: ProductVariant(color: "XXL", size: "red"), level: .normal),
        StockItem(variant: ProductVariant(color: "XXL", size: "steel blue"), level: .normal),
        StockItem(variant: ProductVariant(color: "XXXL", size: "white"), level: .low),
        StockItem(variant: ProductVariant(color: "XXXL", size: "red"), level: .normal),
        StockItem(variant: ProductVariant(color: "XXXL", size: "steel blue"), level: .normal),
      ],
      sizes: ["S", "M", "L", "XL", "XXL", "XXXL"],
      colors: ["white", "black", "red", "steel blue"],
      tags: []
    )
  ]
}
