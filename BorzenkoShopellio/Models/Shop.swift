//
//  Shop.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct ProductCategory: Identifiable {
  let id: String
  let title: String
  let subcategoryIds: [String]
}

struct ProductSubcategory: Identifiable {
  let id: String
  let title: String
  let categoryId: String
}

final class Shop: ObservableObject, Codable {
  // swiftlint:disable:next force_unwrapping
  static let defaultShopJsonURL = Bundle.main.url(forResource: "ShopData", withExtension: "json")!
  static let shopJsonURL = URL(filePath: "ShopData", relativeTo: URL.documentsDirectory).appendingPathExtension("json")

  @Published var colors: [String: String]     // Red: #FF0000
  @Published var sizes: [String]              // One Size, M, XL, 39, etc

  @Published var categories: [String: ProductCategory]
  @Published var orderedCategoryIds: [String]
  @Published var subcategories: [String: ProductSubcategory]

  @Published var products: [Product]

  private init(
    colors: [String: String] = [:],
    sizes: [String] = [],
    categories: [String: ProductCategory] = [:],
    orderedCategoryIds: [String] = [],
    subcategories: [String: ProductSubcategory] = [:],
    products: [Product] = []
  ) {
    self.colors = colors
    self.sizes = sizes
    self.categories = categories
    self.orderedCategoryIds = orderedCategoryIds
    self.subcategories = subcategories
    self.products = products
  }

  static func createFromFile(updateCachedFile: Bool = false) -> Shop {
    let cachedFileExists = FileManager.default.fileExists(atPath: Shop.shopJsonURL.path)
    // assignments 1 & 3
    let sourceURL = cachedFileExists ? Shop.shopJsonURL : Shop.defaultShopJsonURL

    let decoder = JSONDecoder()
    do {
      let shopData = try Data(contentsOf: sourceURL)
      let shop = try decoder.decode(Shop.self, from: shopData)
      if updateCachedFile {
        shop.saveToFile()
      }
      return shop
    } catch let error {
      print(error)
      return Shop()
    }
  }

  private func saveToFile() {
    // assignment 2
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    do {
      let shopData = try encoder.encode(self)
      try shopData.write(to: Shop.shopJsonURL, options: .atomicWrite)
    } catch let error {
      print(error)
    }
  }

  // MARK: - Codable
  enum CodingKeys: CodingKey {
    case colors
    case sizes
    case categories
    case subcategories
    case orderedCategoryIds
    case products
  }

  enum CategoryKeys: CodingKey {
    case id
    case title
    case subcategories
  }

  enum SubcategoryKeys: CodingKey {
    case id
    case title
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    colors = try values.decode([String: String].self, forKey: .colors)
    sizes = try values.decode([String].self, forKey: .sizes)
    products = try values.decode([Product].self, forKey: .products)

    var allCategories: [String: ProductCategory] = [:]
    var allSubcategories: [String: ProductSubcategory] = [:]
    var orderedIds: [String] = []

    var categoriesArray = try values.nestedUnkeyedContainer(forKey: .categories)
    while !categoriesArray.isAtEnd {
      let categoryContainer = try categoriesArray.nestedContainer(keyedBy: CategoryKeys.self)
      let categoryTitle = try categoryContainer.decode(String.self, forKey: .title)
      let categoryId = try categoryContainer.decode(String.self, forKey: .id)

      var subcategoryIds: [String] = []
      var subcategoriesArray = try categoryContainer.nestedUnkeyedContainer(forKey: .subcategories)
      while !subcategoriesArray.isAtEnd {
        let subcategoryContainer = try subcategoriesArray.nestedContainer(keyedBy: SubcategoryKeys.self)
        let subcategoryTitle = try subcategoryContainer.decode(String.self, forKey: .title)
        let subcategoryId = try subcategoryContainer.decode(String.self, forKey: .id)

        let subcategory = ProductSubcategory(id: subcategoryId, title: subcategoryTitle, categoryId: categoryId)
        subcategoryIds.append(subcategoryId)
        allSubcategories[subcategoryId] = subcategory
      }
      allCategories[categoryId] = ProductCategory(id: categoryId, title: categoryTitle, subcategoryIds: subcategoryIds)
      orderedIds.append(categoryId)
    }
    categories = allCategories
    orderedCategoryIds = orderedIds
    subcategories = allSubcategories
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(sizes, forKey: .sizes)
    try container.encode(colors, forKey: .colors)
    try container.encode(products, forKey: .products)

    var categoriesContainer = container.nestedUnkeyedContainer(forKey: .categories)
    for categoryId in orderedCategoryIds {
      guard let category = categories[categoryId] else {
        let context = EncodingError.Context(
          codingPath: [CodingKeys.categories],
          debugDescription: "Inconsistent data for categoryId [\(categoryId)]"
        )
        throw EncodingError.invalidValue(self, context)
      }
      var categoryContainer = categoriesContainer.nestedContainer(keyedBy: CategoryKeys.self)
      try categoryContainer.encode(category.id, forKey: .id)
      try categoryContainer.encode(category.title, forKey: .title)

      var subcategoriesContainer = categoryContainer.nestedUnkeyedContainer(forKey: .subcategories)
      for subcategoryId in category.subcategoryIds {
        guard let subcategory = subcategories[subcategoryId] else {
          let context = EncodingError.Context(
            codingPath: [CodingKeys.categories, CodingKeys.subcategories],
            debugDescription: "Inconsistent data for subcategoryId [\(subcategoryId)]"
          )
          throw EncodingError.invalidValue(self, context)
        }
        var subcategoryContainer = subcategoriesContainer.nestedContainer(keyedBy: SubcategoryKeys.self)
        try subcategoryContainer.encode(subcategory.id, forKey: .id)
        try subcategoryContainer.encode(subcategory.title, forKey: .title)
      }
    }
  }
}
