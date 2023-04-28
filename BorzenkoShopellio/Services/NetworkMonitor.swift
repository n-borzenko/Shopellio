//
//  NetworkMonitor.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 13/04/2023.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
  @MainActor @Published private(set) var isNetworkAvailable = false

  func startMonitoring() async {
    let monitor = NWPathMonitor()
    for await path in monitor.createStream() {
      await MainActor.run {
        isNetworkAvailable = path.status == .satisfied
      }
    }
  }
}

extension NWPathMonitor {
  func createStream() -> AsyncStream<NWPath> {
    return AsyncStream { continuation in
      continuation.onTermination = { [weak self] _ in
        self?.cancel()
      }
      pathUpdateHandler = { path in
        continuation.yield(path)
      }
      start(queue: DispatchQueue(label: "Shopellio.Monitor"))
    }
  }
}
