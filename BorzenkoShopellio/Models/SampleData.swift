//
//  SampleData.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

// swiftlint:disable type_body_length line_length file_length

import Foundation

// TODO: delete when data is available from API


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
      overview: "Trench coat made of a cotton blend fabric. Lapel collar and long sleeves with tabs. Front welt pockets. Back vent at the hem, Double breasted button fastening",
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
      title: "Mini dress with floral print",
      imageUrls: ["https://images.unsplash.com/photo-1617383619176-593fe8bfcde4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=747&q=80"],
      subcategoryId: "dresses",
      price: 32.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "baby pink", size: "XS"), level: .normal),
        StockItem(variant: ProductVariant(color: "baby pink", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "baby pink", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "XS"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "M"), level: .low)
      ],
      sizes: ["XS", "S", "M"],
      colors: ["baby pink", "white"],
      tags: ["new"]
    ),
    Product(
      title: "Puff shoulder pencil dress",
      imageUrls: ["https://images.unsplash.com/photo-1582533575066-75bd83ac91de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=720&q=80"],
      subcategoryId: "dresses",
      price: 55.0,
      discount: 0.2,
      stock: [
        StockItem(variant: ProductVariant(color: "silver", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "silver", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "navy blue", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "navy blue", size: "L"), level: .low)
      ],
      sizes: ["S", "M", "L"],
      colors: ["silver", "navy blue"]
    ),
    Product(
      title: "Multi pocket cargo trouser",
      imageUrls: ["https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"],
      subcategoryId: "trousers",
      price: 35.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "baby pink", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "baby pink", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low)
      ],
      sizes: ["S", "M", "L"],
      colors: ["baby pink", "black"],
      tags: ["new"]
    ),
    Product(
      title: "Black trainers for running",
      imageUrls: ["https://images.unsplash.com/photo-1547586877-0351a7143cbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"],
      subcategoryId: "w_shoes",
      price: 75.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "black", size: "4"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "5"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "6"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "7"), level: .normal)
      ],
      sizes: ["4", "5", "6", "7"],
      colors: ["black"],
      tags: []
    ),
    Product(
      title: "Regular fit suit",
      imageUrls: ["https://images.unsplash.com/photo-1585846416120-3a7354ed7d39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"],
      subcategoryId: "suits",
      price: 129.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "navy blue", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "navy blue", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "navy blue", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "XL"), level: .normal),
        StockItem(variant: ProductVariant(color: "navy blue", size: "XL"), level: .normal)
      ],
      sizes: ["S", "M", "L", "XL"],
      colors: ["black", "navy blue"],
      tags: ["new"]
    ),
    Product(
      title: "Regular fit round-neck t-shirt",
      imageUrls: ["https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"],
      subcategoryId: "t-shirts",
      price: 15.0,
      discount: 0.05,
      stock: [
        StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "red", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "steel blue", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "steel blue", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "red", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "steel blue", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "white", size: "XL"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "XL"), level: .normal),
        StockItem(variant: ProductVariant(color: "red", size: "XL"), level: .normal),
        StockItem(variant: ProductVariant(color: "steel blue", size: "XL"), level: .low),
        StockItem(variant: ProductVariant(color: "white", size: "XXL"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "XXL"), level: .low),
        StockItem(variant: ProductVariant(color: "red", size: "XXL"), level: .normal),
        StockItem(variant: ProductVariant(color: "steel blue", size: "XXL"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "XXXL"), level: .low),
        StockItem(variant: ProductVariant(color: "red", size: "XXXL"), level: .normal),
        StockItem(variant: ProductVariant(color: "steel blue", size: "XXXL"), level: .normal)
      ],
      sizes: ["S", "M", "L", "XL", "XXL", "XXXL"],
      colors: ["white", "black", "red", "steel blue"],
      tags: []
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
    ),
    Product(
      title: "Printed t-shirt with pocket",
      imageUrls: ["https://images.unsplash.com/photo-1613243706336-150bf7ec02f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"],
      subcategoryId: "t-shirts",
      price: 18.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "navy blue", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "navy blue", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "navy blue", size: "L"), level: .low)
      ],
      sizes: ["S", "M", "L"],
      colors: ["white", "black", "navy blue"],
      overview: "Comfortable t-shirt made of soft cotton. V-neck and short sleeves. Chest pocket with printed design.",
      tags: ["new"]
    ),
    Product(
      title: "Satin wrap blouse",
      imageUrls: ["https://images.unsplash.com/photo-1655203091785-9b07e64e4459?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80"],
      subcategoryId: "tops",
      price: 42.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "burgundy", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "burgundy", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "burgundy", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "beige", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "beige", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["burgundy", "black", "beige"],
      overview: "Elegant wrap blouse made of shiny satin fabric. V-neckline and long sleeves with buttoned cuffs. Wrap design with self-tie belt.",
      tags: []
    ),
    Product(
      title: "Cropped hoodie",
      imageUrls: ["https://images.unsplash.com/photo-1600348077475-d4db860d06f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"],
      subcategoryId: "tops",
      price: 45.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "white", size: "XS"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "white", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "white", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "steel blue", size: "XS"), level: .low),
        StockItem(variant: ProductVariant(color: "steel blue", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "steel blue", size: "L"), level: .low)
      ],
      sizes: ["XS", "S", "M", "L"],
      colors: ["white", "steel blue"],
      overview: "Cropped hoodie made of soft cotton blend fabric. Drawstring hood, long sleeves with dropped shoulders, and ribbed cuffs. Front pouch pocket, raw hem. Casual and comfortable design.",
      tags: ["new"]
    ),
    Product(
      title: "Cropped denim jacket",
      imageUrls: ["https://images.unsplash.com/photo-1485811843447-c0989c7b9aae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"],
      subcategoryId: "coats",
      price: 69.0,
      discount: 0.10,
      stock: [
        StockItem(variant: ProductVariant(color: "steel blue", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "steel blue", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "steel blue", size: "XL"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "XL"), level: .low)
      ],
      sizes: ["S", "M", "L", "XL"],
      colors: ["steel blue", "black"]
    ),
    Product(
      title: "Wide-leg trousers",
      imageUrls: ["https://images.unsplash.com/photo-1604136172384-b2e9c43271ec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"],
      subcategoryId: "trousers",
      price: 42.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "white", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low)
      ],
      sizes: ["S", "M", "L"],
      colors: ["white", "black"],
      tags: ["new"]
    ),
    Product(
      title: "Boho midi dress",
      imageUrls: ["https://images.unsplash.com/photo-1490505658643-e96d613eb642?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"],
      subcategoryId: "dresses",
      price: 65.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "beige", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "beige", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "green", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "green", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "green", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["beige", "green"],
      tags: ["new"]
    ),
    Product(
      title: "Leather crossbody bag",
      imageUrls: ["https://images.unsplash.com/photo-1505892458649-41be8480bb4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80"],
      subcategoryId: "accessories",
      price: 89.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "white", size: "One size"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "One size"), level: .low)
      ],
      sizes: ["One size"],
      colors: ["white", "black"]
    ),
    Product(
      title: "Wrap front midi dress",
      imageUrls: ["https://images.unsplash.com/photo-1494578379344-d6c710782a3d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"],
      subcategoryId: "dresses",
      price: 45.0,
      discount: 0.1,
      stock: [
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "baby pink", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "baby pink", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "red", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "red", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["black", "red", "baby pink"],
      overview: "Midi dress made of a soft, lightweight fabric. Wrap front design with v-neckline and short sleeves. Elasticated waist with tie belt. Flowy A-line skirt. Hits at mid-calf length.",
      tags: []
    ),
    Product(
      title: "Denim Shorts",
      imageUrls: ["https://images.unsplash.com/photo-1585145197082-dba095ba01ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=702&q=80"],
      subcategoryId: "trousers",
      price: 29.99,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "blue", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "blue", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "blue", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["blue", "black"],
      overview: "Denim shorts with frayed hem. High waisted with belt loops. Front and back pockets. Zip fly and button closure.",
      tags: ["new"]
    ),
    Product(
      title: "Denim Jacket with Fleece Collar",
      imageUrls: ["https://images.unsplash.com/photo-1521073535089-c3fe0eae04cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"],
      subcategoryId: "coats",
      price: 79.0,
      discount: 0.15,
      stock: [
        StockItem(variant: ProductVariant(color: "blue", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "blue", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "blue", size: "XL"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "XL"), level: .low)
      ],
      sizes: ["S", "M", "L", "XL"],
      colors: ["blue", "black"],
      overview: "Denim jacket featuring a fleece collar, front button fastening, and long sleeves with buttoned cuffs. Four front pockets with buttoned flaps.",
      tags: []
    ),
    Product(
      title: "Cropped mom jeans with embroidery",
      imageUrls: ["https://images.unsplash.com/photo-1510734790177-c931e3956547?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80"],
      subcategoryId: "trousers",
      price: 45.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "steel blue", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "steel blue", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "steel blue", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["steel blue", "black"],
      overview: "Cropped mom jeans featuring embroidery and ripped details. High waist with belt loops, five pockets and zip fly and metal top button fastening.",
      tags: ["new"]
    ),
    Product(
      title: "Cotton shirt with pockets",
      imageUrls: ["https://images.unsplash.com/photo-1517231426114-1ed5cdbe7248?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"],
      subcategoryId: "t-shirts",
      price: 39.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "white", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "white", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "XL"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "XL"), level: .normal)
      ],
      sizes: ["S", "M", "L", "XL"],
      colors: ["white", "black"],
      overview: "Cotton shirt with a lapel collar and short sleeves. Front patch pockets. Front button closure.",
      tags: ["new"]
    ),
    Product(
      title: "Knit sweater with geometric pattern",
      imageUrls: ["https://images.unsplash.com/photo-1527424803383-098895227b9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=737&q=80"],
      subcategoryId: "tops",
      price: 59.99,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "green", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "green", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "green", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "blue", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "blue", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "blue", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["green", "blue"],
      overview: "Knit sweater with a geometric pattern in a relaxed fit. Rib-knit neckline, cuffs and hem.",
      tags: ["new"]
    ),
    Product(
      title: "Cotton blend sweater",
      imageUrls: ["https://images.unsplash.com/photo-1589697547048-962940abc062?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"],
      subcategoryId: "tops",
      price: 49.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "beige", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "beige", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "beige", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "beige", size: "XL"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "XL"), level: .normal)
      ],
      sizes: ["S", "M", "L", "XL"],
      colors: ["beige", "black"],
      overview: "Cotton blend sweater with a round neckline and long sleeves.",
      tags: ["new"]
    )
  ]
}
