//
//  Products.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 12/04/2023.
//

import Foundation

@MainActor
final class Products: ObservableObject {
  private let productsEndpoint = Constants.Network.productsEndpoint
  private let cache: Cacher
  private let apiClient: APIClient
  private weak var shop: Shop?

  @Published var allItems: [Product] = []
  @Published var state = RequestState.idle

  init(
    shop: Shop,
    products: [Product] = [],
    cache: Cacher = Cache.shared,
    apiClient: APIClient = ShopellioAPIClient.shared
  ) {
    self.shop = shop
    self.allItems = products
    self.cache = cache
    self.apiClient = apiClient
  }

  func fetchAndCache() async {
    await fetchProducts()
    if state == .finished {
      await save()
    }
  }

  func getCachedOrFetch() async {
    do {
      try await read()
      state = .finished
      return
    } catch {}
    await fetchAndCache()
  }
}

// MARK: - Network and Cache
extension Products {
  private func fetchProducts() async {
    state = .loading

    do {
      allItems = try await apiClient.performGetRequest(endpoint: productsEndpoint)
      state = .finished
    } catch let error {
      if let error = error as? APIClientError {
        #if DEBUG
        print("Products fetch request failed: \(error.shortDescription)")
        #endif
      }
      state = .failed
    }
  }

  private func save() async {
    do {
      try await cache.saveToFile(allItems, for: .products)
    } catch { }
  }

  private func read() async throws {
    allItems = try await cache.readFromFile(for: .products)
  }
}

// MARK: - Filter products
extension Products {
  func filterProducts(collectionId: String? = nil, categoryId: String? = nil, subcategoryId: String? = nil) -> [Product] {
    // currently 2 hardcoded collections are supported
    if let collectionId = collectionId {
      switch collectionId {
      case Constants.ProductGroups.newGroupKey:
        return filterNewProducts(categoryId: categoryId)
      case Constants.ProductGroups.saleGroupKey:
        return filterDiscountedProducts(categoryId: categoryId)
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
