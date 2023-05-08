//
//  Cache.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 12/04/2023.
//

import Foundation

protocol Cacher {
  func doesCachedFileExist(for item: CachedItem) async -> Bool
  func readFromFile<T: Decodable>(for item: CachedItem) async throws -> T
  func saveToFile<T: Encodable>(_ element: T, for item: CachedItem) async throws
}

enum CacheError: Error {
  case fileNotFound
  case decodingFailure
  case encodingFailure
}

enum CachedItem {
  case shop
  case products
  case cartItems

  var fileURL: URL {
    switch self {
    case .shop:
      return URL(
        filePath: Constants.Cache.shopFilePath,
        relativeTo: URL.documentsDirectory
      )
      .appendingPathExtension(Constants.Cache.fileExtension)
    case .products:
      return URL(
        filePath: Constants.Cache.productsFilePath,
        relativeTo: URL.documentsDirectory
      )
      .appendingPathExtension(Constants.Cache.fileExtension)
    case .cartItems:
      return URL(
        filePath: Constants.Cache.cartItemsFilePath,
        relativeTo: URL.documentsDirectory
      )
      .appendingPathExtension(Constants.Cache.fileExtension)
    }
  }
}

actor Cache: Cacher {
  static let shared = Cache()

  private init() {}

  func doesCachedFileExist(for item: CachedItem) -> Bool {
    return FileManager.default.fileExists(atPath: item.fileURL.path)
  }

  func readFromFile<T: Decodable>(for item: CachedItem) throws -> T {
    guard doesCachedFileExist(for: item) else {
      throw CacheError.fileNotFound
    }

    do {
      let data = try Data(contentsOf: item.fileURL)
      let result = try JSONDecoder().decode(T.self, from: data)
      return result
    } catch {
      throw CacheError.decodingFailure
    }
  }

  func saveToFile<T: Encodable>(_ element: T, for item: CachedItem) throws {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
      if doesCachedFileExist(for: item) {
        try FileManager.default.removeItem(at: item.fileURL)
      }
      let data = try encoder.encode(element)
      try data.write(to: item.fileURL, options: .atomicWrite)
    } catch {
      throw CacheError.encodingFailure
    }
  }
}
