//
//  ErrorStateView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 16/04/2023.
//

import SwiftUI

enum ErrorState {
  case requestError
  case emptyCart
  case emptySearchResults
  case emptyProductGroup

  var imageName: String {
    switch self {
    case .requestError: return Constants.ErrorStateView.requestErrorImage
    case .emptyCart: return Constants.ErrorStateView.emptyCartImage
    case .emptySearchResults: return Constants.ErrorStateView.emptySearchResultsImage
    case .emptyProductGroup: return Constants.ErrorStateView.emptyProductGroupImage
    }
  }

  var message: String {
    switch self {
    case .requestError:
      return Constants.ErrorStateView.requestErrorMessage
    case .emptyCart:
      return Constants.ErrorStateView.emptyCartMessage
    case .emptySearchResults:
      return Constants.ErrorStateView.emptySearchResultsMessage
    case .emptyProductGroup:
      return Constants.ErrorStateView.emptyProductGroupMessage
    }
  }
}

struct ErrorStateView: View {
  @StateObject private var networkMonitor = NetworkMonitor()
  var isLoading = false
  var state: ErrorState?
  var actionTitle = Constants.ErrorStateView.requestErrorActionTitle
  var action: (() -> Void)?

  var body: some View {
    VStack {
      Spacer(minLength: Constants.ErrorStateView.minSpacerLength)

      if isLoading {
        LoadingView(scale: .large)
          .frame(
            maxWidth: Constants.ErrorStateView.imageMaxWidth,
            maxHeight: Constants.ErrorStateView.imageMaxWidth
          )
          .aspectRatio(Constants.ErrorStateView.loadingAspectRatio, contentMode: .fit)
          .padding(.horizontal, Constants.ErrorStateView.imageHorizontalPadding)
      }
      if !isLoading, let state = state {
        Image(state.imageName)
          .resizable()
          .scaledToFit()
          .frame(maxWidth: Constants.ErrorStateView.imageMaxWidth)
          .padding(.horizontal, Constants.ErrorStateView.imageHorizontalPadding)
      }

      VStack(spacing: Constants.ErrorStateView.verticalStackSpacing) {
        if state == .requestError {
          NetworkStatusView(isAvailable: networkMonitor.isNetworkAvailable)
        }
        if let state = state {
          Text(state.message)
            .font(.headline)
            .multilineTextAlignment(.center)
            .foregroundColor(.textColor)
            .frame(maxWidth: Constants.ErrorStateView.errorMessageMaxWidth)
        }
        if let action = action {
          Button(actionTitle) {
            action()
          }
          .buttonStyle(.borderedProminent)
          .foregroundColor(.invertedContrastColor)
          .disabled(!networkMonitor.isNetworkAvailable || isLoading)
        }
      }
      .padding(.top, Constants.ErrorStateView.verticalStackTopPadding)

      Spacer(minLength: Constants.ErrorStateView.minSpacerLength)
      Spacer(minLength: Constants.ErrorStateView.minSpacerLength)
    }
    .padding()
  }
}

struct NetworkStatusView: View {
  var isAvailable: Bool

  var body: some View {
    HStack {
      (isAvailable ? Image.wifi : Image.wifiSlash)
        .foregroundColor(isAvailable ? .green : .red)
      Text(
        isAvailable ?
        Constants.ErrorStateView.networkOnlineTitle :
          Constants.ErrorStateView.networkOfflineTitle
      )
      .font(.footnote)
      .multilineTextAlignment(.center)
      .foregroundColor(.textColor)
      .opacity(Constants.ErrorStateView.networkStatusOpacity)
    }
  }
}

struct ErrorStateView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ErrorStateView(isLoading: true, state: .requestError) {}
      ErrorStateView(state: .requestError) {}
      ErrorStateView(state: .emptyCart, actionTitle: "Go shopping") {}
      ErrorStateView(state: .emptyProductGroup)
      ErrorStateView(state: .emptySearchResults)
    }
    .background(Color.backgroundColor)
  }
}
