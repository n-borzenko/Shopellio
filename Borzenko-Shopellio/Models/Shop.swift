//
//  Shop.swift
//  Borzenko-Shopellio
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

class Shop: ObservableObject {
  @Published var colors: [String: String]      // Red: #FF0000
  @Published var  sizes: [String]               // One Size, M, XL, 39, etc

  @Published var categories: [String: ProductCategory]
  @Published var orderedCategoryIds: [String]
  @Published var subcategories: [String: ProductSubcategory]

  init(colors: [String: String], sizes: [String], categories: [String: ProductCategory], orderedCategoryIds: [String], subcategories: [String : ProductSubcategory]) {
    self.colors = colors
    self.sizes = sizes
    self.categories = categories
    self.orderedCategoryIds = orderedCategoryIds
    self.subcategories = subcategories
  }
}


// expected categories structure from backend
//  [
//    {
//      id: "tops",
//      title: "Tops",
//      subcategories: [
//        { id: "hoodies", title: "Hoodies" },
//        { id: "t_shirts", title: "T-shirts" }
//      ]
//    },
//    {
//      id: "bottoms",
//      title: "Bottoms",
//      subcategories: [
//        { id: "jeans", title: "Jeans" },
//        { id: "skirts", title: "Skirts" }
//      ]
//    }
//  ]
