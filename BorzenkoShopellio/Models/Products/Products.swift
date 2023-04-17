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
  @Published var filteredItems: [Product] = []
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

  func filterItems(color: String = "black") {
    filteredItems = allItems.filter { $0.colors.contains(color) }
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
