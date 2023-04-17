//
//  ATSTestModel.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 17/04/2023.
//

import Foundation

struct FakeSoreProduct: Codable {
  let id: Int
  let title: String
  let price: Double
  let category: String
  let description: String?
  let image: String?
}

@MainActor
enum ATSTestModel {
  static func fetchShopellioProducts() async {
    do {
      // Week09 #3
      // Server sends 308 Permanent Redirect to https url
      let result: [Product] = try await APIClient.shared.performGetRequest(
        url: URL(string: "http://shopellio.nborzenko.me/api/"),
        endpoint: "products"
      )
      #if DEBUG
      print("HTTP Shopellio Products fetch request result: \(result.count) items")
      #endif
    } catch let error {
      if let error = error as? APIClient.Error {
        #if DEBUG
        print("HTTP Shopellio Products fetch request failed: \(error.shortDescription)")
        #endif
      }
    }
  }

  static func fetchFakeStoreProducts() async {
    do {
      // Week09 #3
      // API supports both http and https protocols
      let result: [FakeSoreProduct] = try await APIClient.shared.performGetRequest(
        url: URL(string: "http://fakestoreapi.com"),
        endpoint: "products"
      )
      #if DEBUG
      print("HTTP Fake Store Products fetch request result: \(result.count) items")
      #endif
    } catch let error {
      if let error = error as? APIClient.Error {
        #if DEBUG
        print("HTTP Fake Store Products fetch request failed: \(error.shortDescription)")
        #endif
      }
    }
  }
}
