//
//  NetworkMonitor.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 13/04/2023.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
  private let monitor = NWPathMonitor()
  private let queue = DispatchQueue(label: "Monitor")
  @Published private(set) var isNetworkAvailable = false

  init() {
    monitor.pathUpdateHandler = { path in
      Task {
        await MainActor.run {
          self.isNetworkAvailable = path.status == .satisfied
        }
      }
    }
    monitor.start(queue: queue)
  }
}
