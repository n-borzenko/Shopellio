//
//  Shop.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import Foundation

struct ShopContent: Codable {
  var collections: [ProductCollection]
  var categories: [ProductCategory]
  var colors: [String: String]
}

@MainActor
final class Shop: ObservableObject {
  private let shopEndpoint = Constants.Network.shopEndpoint
  private let cache: Cacher
  private let apiClient: APIClient

  @Published var collections: [ProductCollection]
  @Published var categories: [ProductCategory]
  @Published var colors: [String: String]
  @Published var state = RequestState.idle

  init(
    collections: [ProductCollection] = [],
    categories: [ProductCategory] = [],
    colors: [String: String] = [:],
    cache: Cacher = Cache.shared,
    apiClient: APIClient = ShopellioAPIClient.shared
  ) {
    self.collections = collections
    self.categories = categories
    self.colors = colors
    self.cache = cache
    self.apiClient = apiClient
  }

  func fetchAndCache() async {
    await fetchShop()
    if state == .finished {
      await save()
    }
  }

  func getCachedOrFetch() async {
    do {
      try await read()
      state = .finished
      return
    } catch { }
    await fetchAndCache()
  }
}

// MARK: - Network and Cache
extension Shop {
  private func fetchShop() async {
    state = .loading
    do {
      let content: ShopContent = try await apiClient.performGetRequest(endpoint: shopEndpoint)
      collections = content.collections
      categories = content.categories
      colors = content.colors
      state = .finished
    } catch let error {
      if let error = error as? APIClientError {
        #if DEBUG
        print("Shop fetch request failed: \(error.shortDescription)")
        #endif
      }
      state = .failed
    }
  }

  private func save() async {
    do {
      let shopContent = ShopContent(collections: collections, categories: categories, colors: colors)
      try await Cache.shared.saveToFile(shopContent, for: .shop)
    } catch { }
  }

  private func read() async throws {
    let content: ShopContent = try await Cache.shared.readFromFile(for: .shop)
    collections = content.collections
    categories = content.categories
    colors = content.colors
  }
}
