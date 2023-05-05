//
//  APIClient.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 10/04/2023.
//

import Foundation

protocol APIClient {
  func performGetRequest<T: Decodable>(endpoint: String) async throws -> T
}

enum APIClientError: Error {
  case invalidURL
  case connectionError
  case failedRequest
  case invalidResponse
  case serverError
  case notFound
  case failedDecoding

  var shortDescription: String {
    switch self {
    case .invalidURL: return Constants.Network.invalidURLText
    case .connectionError: return Constants.Network.connectionErrorText
    case .failedRequest: return Constants.Network.failedRequestText
    case .invalidResponse: return Constants.Network.invalidResponseText
    case .serverError: return Constants.Network.serverErrorText
    case .notFound: return Constants.Network.notFoundText
    case .failedDecoding: return Constants.Network.failedDecodingText
    }
  }
}

class ShopellioAPIClient: APIClient {
  static let shared = ShopellioAPIClient()
  private static let baseURL = URL(string: Constants.Network.baseURLString)

  private let configuration: URLSessionConfiguration
  private let session: URLSession

  private init() {
    self.configuration = URLSessionConfiguration.default
    self.configuration.timeoutIntervalForRequest = 30
    self.session = URLSession(configuration: configuration)
  }

  // swiftlint:disable:next cyclomatic_complexity
  func performGetRequest<T: Decodable>(endpoint: String) async throws -> T {
    guard let url = ShopellioAPIClient.baseURL?.appendingPathComponent(endpoint) else {
      throw APIClientError.invalidURL
    }

    let request = URLRequest(url: url)

    var requestResult: (Data, URLResponse)
    do {
      requestResult = try await session.data(for: request)
    } catch let error {
      if let error = error as? URLError {
        switch error.code {
        case .notConnectedToInternet, .timedOut, .networkConnectionLost:
          throw APIClientError.connectionError
        default:
          throw APIClientError.failedRequest
        }
      }
      throw APIClientError.failedRequest
    }

    let (data, response) = requestResult
    guard let response = response as? HTTPURLResponse else {
      throw APIClientError.invalidResponse
    }

    guard response.statusCode == 200 else {
      switch response.statusCode {
      case 500...599:
        throw APIClientError.serverError
      case 404:
        throw APIClientError.notFound
      default:
        throw APIClientError.invalidResponse
      }
    }

    do {
      let result = try JSONDecoder().decode(T.self, from: data)
      return result
    } catch {
      throw APIClientError.failedDecoding
    }
  }
}
