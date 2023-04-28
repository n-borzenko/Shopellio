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

final class Shop: ObservableObject {
  @MainActor @Published var collections: [ProductCollection]
  @MainActor @Published var categories: [ProductCategory]
  @MainActor @Published var colors: [String: String]
  @MainActor @Published var state = RequestState.idle
  @Published var errorMessage: String?

  private let shopEndpoint = "shop"

  @MainActor
  init(
    collections: [ProductCollection] = [],
    categories: [ProductCategory] = [],
    colors: [String: String] = [:]
  ) {
    self.collections = collections
    self.categories = categories
    self.colors = colors
  }

  func fetchAndCache() async {
    await MainActor.run {
      errorMessage = nil
    }
    await fetchShop()
    if await state == .finished {
      // Week09 save response to documents directory
      await save()
    }
  }

  func getCachedOrFetch() async {
    await MainActor.run {
      errorMessage = nil
    }
    if Cache.shared.isCachedFileExists(for: .shop) {
      do {
        try await read()
        await MainActor.run {
          state = .finished
        }
        return
      } catch { }
    }
    await fetchAndCache()
  }
}

// MARK: - Network and Cache
extension Shop {
  @MainActor
  private func fetchShop() async {
    state = .loading

    do {
      // Week09 #2
      let content: ShopContent = try await APIClient.shared.performGetRequest(endpoint: shopEndpoint)
      collections = content.collections
      categories = content.categories
      colors = content.colors
      state = .finished
    } catch let error {
      if let error = error as? APIClient.Error {
        errorMessage = error.shortDescription
        #if DEBUG
        print("Shop fetch request failed: \(errorMessage ?? "")")
        #endif
      }
      state = .failed
    }
  }

  private func save() async {
    do {
      let shopContent = await ShopContent(collections: collections, categories: categories, colors: colors)
      try Cache.shared.saveToFile(shopContent, for: .shop)
    } catch { }
  }

  private func read() async throws {
    let content: ShopContent = try Cache.shared.readFromFile(for: .shop)
    await MainActor.run {
      collections = content.collections
      categories = content.categories
      colors = content.colors
    }
  }
}
