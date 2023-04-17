//
//  Products.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 12/04/2023.
//

import Foundation

@MainActor
final class Products: ObservableObject {
  private let productsEndpoint = "products"

  private weak var shop: Shop?

  @Published var allItems: [Product] = []
  @Published var state = RequestState.idle
  @Published var errorMessage: String?

  init(shop: Shop, products: [Product] = []) {
    self.shop = shop
    self.allItems = products
  }

  func fetchAndCache() async {
    errorMessage = nil
    await fetchProducts()
    if state == .finished {
      // Week09 save response to documents directory
      save()
    }
  }

  func getCachedOrFetch() async {
    errorMessage = nil
    if Cache.shared.isCachedFileExists(for: .products) {
      do {
        try read()
        state = .finished
        return
      } catch {}
    }
    await fetchAndCache()
  }
}

// MARK: - Network and Cache
extension Products {
  private func fetchProducts() async {
    state = .loading

    do {
      // Week09 #2
      allItems = try await APIClient.shared.performGetRequest(endpoint: productsEndpoint)
      state = .finished
    } catch let error {
      if let error = error as? APIClient.Error {
        errorMessage = error.shortDescription
        #if DEBUG
        print("Products fetch request failed: \(errorMessage ?? "")")
        #endif
      }
      state = .failed
    }
  }

  private func save() {
    do {
      try Cache.shared.saveToFile(allItems, for: .products)
    } catch { }
  }

  private func read() throws {
    allItems = try Cache.shared.readFromFile(for: .products)
  }
}

// MARK: - Filter products
extension Products {
  func filterProducts(collectionId: String? = nil, categoryId: String? = nil, subcategoryId: String? = nil) -> [Product] {
    // currently 2 hardcoded collections are supported
    if let collectionId = collectionId {
      switch collectionId {
      case "new": return filterNewProducts(categoryId: categoryId)
      case "sale": return filterDiscountedProducts(categoryId: categoryId)
      default: return []
      }
    }

    if let subcategoryId = subcategoryId {
      return allItems.filter { $0.subcategoryId == subcategoryId }
    }

    if let categoryId = categoryId {
      guard let category = shop?.categories.first(where: { $0.id == categoryId }) else {
        return []
      }
      let ids = Set(category.subcategories.map { $0.id })
      return allItems.filter { ids.contains($0.subcategoryId) }
    }

    return []
  }

  private func filterNewProducts(categoryId: String? = nil) -> [Product] {
    var ids = Set<String>()

    if let shop = shop, let categoryId = categoryId,
       let category = shop.categories.first(where: { $0.id == categoryId }) {
      ids = Set(category.subcategories.map { $0.id })
    }

    return allItems.filter { product in
      guard product.tags.contains(Constants.Product.newArrivalTag) else {
        return false
      }
      return categoryId != nil ? ids.contains(product.subcategoryId) : true
    }
  }

  private func filterDiscountedProducts(categoryId: String? = nil) -> [Product] {
    var ids = Set<String>()

    if let shop = shop, let categoryId = categoryId,
       let category = shop.categories.first(where: { $0.id == categoryId }) {
      ids = Set(category.subcategories.map { $0.id })
    }

    return allItems.filter { product in
      guard product.discount > 0 else {
        return false
      }
      return categoryId != nil ? ids.contains(product.subcategoryId) : true
    }
  }
}
