//
//  KodecoClient.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 17/04/2023.
//

import Foundation

@MainActor
enum KodecoClient {
  static func fetchCookies() async {
    do {
      // Week09 #4
      let cookies = try await APIClient.shared.getCookiesFromRequest(
        url: URL(string: "https://www.kodeco.com/")
      )
      #if DEBUG
      let result = cookies.reduce(into: "Kodeco cookies:\n") {
        $0 += "name:\($1.name)\nvalue:\($1.value)\n"
      }
      print(result)
      #endif
    } catch let error {
      if let error = error as? APIClient.Error {
        #if DEBUG
        print("Kodeco cookies fetching failed: \(error.shortDescription)")
        #endif
      }
    }
  }
}
