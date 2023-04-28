//
//  Cache.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 12/04/2023.
//

import Foundation

class Cache {
  static let shared = Cache()

  private init() {}

  func doesCachedFileExist(for item: CachedItem) -> Bool {
    return FileManager.default.fileExists(atPath: item.fileURL.path)
  }

  func readFromFile<T: Decodable>(for item: CachedItem) throws -> T {
    guard doesCachedFileExist(for: item) else {
      throw Error.fileNotFound
    }

    do {
      let data = try Data(contentsOf: item.fileURL)
      let result = try JSONDecoder().decode(T.self, from: data)
      return result
    } catch {
      throw Error.decodingFailure
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
      throw Error.encodingFailure
    }
  }
}

extension Cache {
  enum CachedItem {
    case shop
    case products
    case cartItems

    var fileURL: URL {
      switch self {
      case .shop:
        return URL(filePath: "ShopData", relativeTo: URL.documentsDirectory).appendingPathExtension("json")
      case .products:
        return URL(filePath: "ProductsData", relativeTo: URL.documentsDirectory).appendingPathExtension("json")
      case .cartItems:
        return URL(filePath: "CartItemsData", relativeTo: URL.documentsDirectory).appendingPathExtension("json")
      }
    }
  }

  enum Error: Swift.Error {
    case fileNotFound
    case decodingFailure
    case encodingFailure
  }
}
