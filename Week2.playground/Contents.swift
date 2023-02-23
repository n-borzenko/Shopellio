import UIKit

enum ProductCategory: Int {
  case food = 1
  case clothes
  case household
  case animals
  case stationery

  // TODO: add description, sf icon symbol, consider structs implementing same protocol
}

struct Product: CustomStringConvertible {
  let id: Int
  var name: String
  var price: Double
  var specification: String
  var imageURL: String?
  var category: ProductCategory

  var description: String {
    return """
      \(id): name: \(name)
        price: \(price)
        specification: \(specification)
        imageURL: \(imageURL ?? "")
        category: \(category.rawValue)
    """
  }
}

var productList: [Product] = []

let product1 = Product(
  id: 1,
  name: "Whole Milk",
  price: 1.3,
  specification: "Whole Milk 1.13L (2 pint)",
  category: .food
)
let product2 = Product(
  id: 2,
  name: "Conference Pears",
  price: 2.0,
  specification: "Conference Pears, Ripe & Ready x4",
  imageURL: "/pears.png",
  category: .food
)
let product3 = Product(
  id: 3,
  name: "Green midi skirt",
  price: 5.9,
  specification: "Women's Stretch Midi Pencil Green Skirt",
  imageURL: "/skirt_green.png",
  category: .clothes
)
let product4 = Product(
  id: 4,
  name: "Kitchen Towels",
  price: 3.0,
  specification: "Super Absorbent Kitchen Towels x2",
  imageURL: "/kitchen_towels.png",
  category: .household
)
let product5 = Product(
  id: 5,
  name: "Post It Notes",
  price: 3.5,
  specification: "Post It Notes Super Sticky Lined Pads",
  imageURL: "/post-it-notes.png",
  category: .stationery
)
let product6 = Product(
  id: 6,
  name: "Printer Paper",
  price: 7.5,
  specification: "A4 Printer Paper 75Gsm 500 Sheets",
  category: .stationery
)

func appendToList(_ product: Product) {
  productList.append(product)
}

appendToList(product1)
appendToList(product2)
appendToList(product3)
appendToList(product4)
appendToList(product5)
appendToList(product6)

func printProductsWithImages() {
  productList.forEach { product in
    guard product.imageURL != nil else {
      return
    }
    print(product)
  }
}

printProductsWithImages()
