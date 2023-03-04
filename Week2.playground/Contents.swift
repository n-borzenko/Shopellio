import UIKit

enum ProductCategory: String {
  case fruits
  case clothes
  case stationery
}

struct Review {
  var text: String
  var imageURLs: [String]?
  var rating: Int
}

struct Product: CustomStringConvertible {
  let id: Int
  var name: String
  var price: Double
  var specification: String
  var imageURL: String
  var category: ProductCategory?
  var reviews: [Review] = []

  var description: String {
    return """
      \(id):
      name: \(name)
      price: \(price)
      specification: \(specification)
      imageURL: \(imageURL)
      category: \(category?.rawValue ?? "")
      reviewCount: \(reviews.count)
    """
  }
}

var productList: [Product] = []

let product1 = Product(
  id: 1,
  name: "Whole Milk",
  price: 1.3,
  specification: "Whole Milk 1.13L (2 pint)",
  imageURL: "/milk.png"
)
let product2 = Product(
  id: 2,
  name: "Conference Pears",
  price: 2.0,
  specification: "Conference Pears, Ripe & Ready x4",
  imageURL: "/pears.png",
  category: .fruits,
  reviews: [
    Review(text: "tasty", rating: 5),
    Review(text: "healthy", rating: 4)
  ]
)
let product3 = Product(
  id: 3,
  name: "Green midi skirt",
  price: 5.9,
  specification: "Women's Stretch Midi Pencil Green Skirt",
  imageURL: "/skirt_green.png",
  category: .clothes,
  reviews: [
    Review(text: "too small", rating: 3),
    Review(text: "nice one", imageURLs: ["/photo23342.jpeg", "/photo43728935.jpeg"], rating: 4)
  ]
)
let product4 = Product(
  id: 4,
  name: "Kitchen Towels",
  price: 3.0,
  specification: "Super Absorbent Kitchen Towels x2",
  imageURL: "/kitchen_towels.png"
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
  imageURL: "/printer_paper.png",
  category: .stationery,
  reviews: [
    Review(text: "expensive, good quality", rating: 4)
  ]
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

func printСategorizedProducts() {
  productList.forEach { product in
    guard product.category != nil else {
      return
    }
    print(product)
  }
}

printСategorizedProducts()
