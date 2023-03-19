//
//  Shop.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct ProductCategory {
  let id: String
  let title: String
  let subcategoryIds: [String]
}

struct ProductSubcategory {
  let id: String
  let title: String
  let categoryId: String
}

struct Shop {
  let colors: [String: String]      // Red: FF0000
  let sizes: [String]               // One Size, M, XL, 39, etc

  let categories: [String: ProductCategory]
  let orderedCategoryIds: [String]
  let subcategories: [String: ProductSubcategory]
}


// expected categories structure from backend
//[
//  {
//    id: "tops",
//    title: "Tops",
//    subcategories: [
//      { id: "hoodies", title: "Hoodies" },
//      { id: "t_shirts", title: "T-shirts" }
//    ]
//  },
//  {
//    id: "bottoms",
//    title: "Bottoms",
//    subcategories: [
//      { id: "jeans", title: "Jeans" },
//      { id: "skirts", title: "Skirts" }
//    ]
//  }
//]
