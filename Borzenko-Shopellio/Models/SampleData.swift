//
//  SampleData.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

// swiftlint:disable type_body_length
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
      "brown": "#964B00"
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
      imageUrls: [],
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
        StockItem(variant: ProductVariant(color: "white", size: "M"), level: .low)
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
        StockItem(variant: ProductVariant(color: "navy blue", size: "L"), level: .low)
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
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low)
      ],
      sizes: ["S", "M", "L"],
      colors: ["beige", "black"],
      tags: ["new"]
    ),
    Product(
      title: "Black trainers for running",
      imageUrls: [],
      subcategoryId: "w_shoes",
      price: 75.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "4", size: ""), level: .low),
        StockItem(variant: ProductVariant(color: "5", size: ""), level: .normal),
        StockItem(variant: ProductVariant(color: "6", size: ""), level: .low),
        StockItem(variant: ProductVariant(color: "7", size: ""), level: .normal)
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
        StockItem(variant: ProductVariant(color: "XL", size: "navy blue"), level: .normal)
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
        StockItem(variant: ProductVariant(color: "XXXL", size: "steel blue"), level: .normal)
      ],
      sizes: ["S", "M", "L", "XL", "XXL", "XXXL"],
      colors: ["white", "black", "red", "steel blue"],
      tags: []
    ),
    Product(
      title: "Basic T-shirt",
      imageUrls: [],
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
        StockItem(variant: ProductVariant(color: "green", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "green", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["white", "black", "gray", "red", "blue", "green"],
      overview: "A basic T-shirt made of soft cotton fabric. Round neckline and short sleeves.",
      tags: ["new"]
    ),
    Product(
      title: "Printed t-shirt with pocket",
      imageUrls: [],
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
      imageUrls: [],
      subcategoryId: "tops",
      price: 42.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "burgundy", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "burgundy", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "burgundy", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "navy blue", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "navy blue", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["burgundy", "black", "navy blue"],
      overview: "Elegant wrap blouse made of shiny satin fabric. V-neckline and long sleeves with buttoned cuffs. Wrap design with self-tie belt.",
      tags: []
    ),
    Product(
      title: "Cropped hoodie",
      imageUrls: [],
      subcategoryId: "tops",
      price: 45.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "white", size: "XS"), level: .normal),
        StockItem(variant: ProductVariant(color: "white", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "white", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "white", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "XS"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .low)
      ],
      sizes: ["XS", "S", "M", "L"],
      colors: ["white", "black"],
      overview: "Cropped hoodie made of soft cotton blend fabric. Drawstring hood, long sleeves with dropped shoulders, and ribbed cuffs. Front pouch pocket, raw hem. Casual and comfortable design.",
      tags: ["new"]
    ),
    Product(
      title: "Cropped denim jacket",
      imageUrls: [],
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
      imageUrls: [],
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
      imageUrls: [],
      subcategoryId: "dresses",
      price: 65.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "beige", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "beige", size: "L"), level: .low),
        StockItem(variant: ProductVariant(color: "green", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "green", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "green", size: "L"), level: .normal),
      ],
      sizes: ["S", "M", "L"],
      colors: ["beige", "green"],
      tags: ["new"]
    ),
    Product(
      title: "Leather crossbody bag",
      imageUrls: [],
      subcategoryId: "accessories",
      price: 89.0,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "brown", size: "One size"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "One size"), level: .low)
      ],
      colors: ["brown", "black"]
    ),
    Product(
      title: "Wrap front midi dress",
      imageUrls: [],
      subcategoryId: "dresses",
      price: 45.0,
      discount: 0.1,
      stock: [
        StockItem(variant: ProductVariant(color: "black", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "black", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "black", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "red", size: "S"), level: .low),
        StockItem(variant: ProductVariant(color: "red", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["black", "red"],
      overview: "Midi dress made of a soft, lightweight fabric. Wrap front design with v-neckline and short sleeves. Elasticated waist with tie belt. Flowy A-line skirt. Hits at mid-calf length.",
      tags: []
    ),
    Product(
      title: "Denim Shorts",
      imageUrls: [],
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
      imageUrls: [],
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
      imageUrls: [],
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
      imageUrls: [],
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
      imageUrls: [],
      subcategoryId: "tops",
      price: 59.99,
      discount: 0.0,
      stock: [
        StockItem(variant: ProductVariant(color: "gray", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "gray", size: "M"), level: .low),
        StockItem(variant: ProductVariant(color: "gray", size: "L"), level: .normal),
        StockItem(variant: ProductVariant(color: "blue", size: "S"), level: .normal),
        StockItem(variant: ProductVariant(color: "blue", size: "M"), level: .normal),
        StockItem(variant: ProductVariant(color: "blue", size: "L"), level: .normal)
      ],
      sizes: ["S", "M", "L"],
      colors: ["gray", "blue"],
      overview: "Knit sweater with a geometric pattern in a relaxed fit. Rib-knit neckline, cuffs and hem.",
      tags: ["new"]
    ),
    Product(
      title: "Cotton blend sweater",
      imageUrls: [],
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
// swiftlint:enable type_body_length
