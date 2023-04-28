//
//  APIClient.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 10/04/2023.
//

import Foundation

class APIClient {
  enum Error: Swift.Error {
    case invalidURL
    case connectionError
    case failedRequest
    case invalidResponse
    case serverError
    case notFound
    case failedDecoding
    case cookiesNotFound

    var shortDescription: String {
      switch self {
      case .invalidURL: return "Failed to create the request the server"
      case .connectionError: return "Failed to establish connection to the server"
      case .failedRequest: return "Failed to query the server"
      case .invalidResponse: return "Failed to parse the response"
      case .serverError: return "Server error occurred"
      case .notFound: return "Requested data was not found"
      case .failedDecoding: return "Failed to parse the response"
      case .cookiesNotFound: return "Failed to parse cookies"
      }
    }
  }

  static let shared = APIClient()
  private static let baseURL = URL(string: "https://shopellio.nborzenko.me/api/")

  private let configuration: URLSessionConfiguration
  private let session: URLSession

  private init() {
    self.configuration = URLSessionConfiguration.default
    self.configuration.timeoutIntervalForRequest = 30
    self.session = URLSession(configuration: configuration)
  }

  // swiftlint:disable:next cyclomatic_complexity
  func performGetRequest<T: Decodable>(url: URL? = APIClient.baseURL, endpoint: String) async throws -> T {
    guard let url = url?.appendingPathComponent(endpoint) else {
      throw Error.invalidURL
    }

    let request = URLRequest(url: url)

    var requestResult: (Data, URLResponse)
    do {
      requestResult = try await session.data(for: request)
    } catch let error {
      if let error = error as? URLError {
        switch error.code {
        case .notConnectedToInternet, .timedOut, .networkConnectionLost:
          throw Error.connectionError
        default:
          throw Error.failedRequest
        }
      }
      throw Error.failedRequest
    }

    let (data, response) = requestResult
    guard let response = response as? HTTPURLResponse else {
      throw Error.invalidResponse
    }

    guard response.statusCode == 200 else {
      switch response.statusCode {
      case 500...599:
        throw Error.serverError
      case 404:
        throw Error.notFound
      default:
        throw Error.invalidResponse
      }
    }

    do {
      let result = try JSONDecoder().decode(T.self, from: data)
      return result
    } catch {
      throw Error.failedDecoding
    }
  }
}
