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
  case emptyProductGroup

  var imageName: String {
    switch self {
    case .requestError: return Constants.ErrorStateView.requestErrorImage
    case .emptyCart: return Constants.ErrorStateView.emptyCartImage
    case .emptyProductGroup: return Constants.ErrorStateView.emptyProductGroupImage
    }
  }

  var message: String {
    switch self {
    case .requestError:
      return Constants.ErrorStateView.requestErrorMessage
    case .emptyCart:
      return Constants.ErrorStateView.emptyCartMessage
    case .emptyProductGroup:
      return Constants.ErrorStateView.emptyProductGroupMessage
    }
  }
}

struct ErrorStateView: View {
  var isLoading = false
  var state: ErrorState?
  var actionTitle = Constants.ErrorStateView.requestErrorActionTitle
  var action: (() -> Void)?

  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Spacer(minLength: Constants.ErrorStateView.minSpacerLength)

          if isLoading {
            LoadingView(scale: .large)
              .aspectRatio(Constants.ErrorStateView.loadingAspectRatio, contentMode: .fit)
              .frame(
                maxWidth: Constants.ErrorStateView.imageMaxWidth,
                maxHeight: geo.size.height / 2
              )
              .padding(.horizontal, Constants.ErrorStateView.imageHorizontalPadding)
          }
          if !isLoading, let state = state {
            Image(state.imageName)
              .resizable()
              .scaledToFit()
              .frame(
                maxWidth: Constants.ErrorStateView.imageMaxWidth,
                maxHeight: geo.size.height / 2
              )
              .padding(.horizontal, Constants.ErrorStateView.imageHorizontalPadding)
          }

          VStack(spacing: Constants.ErrorStateView.verticalStackSpacing) {
            if state == .requestError {
              NetworkStatusView()
            }
            if let state = state {
              Text(state.message)
                .headlineStyle()
                .multilineTextAlignment(.center)
                .frame(maxWidth: Constants.ErrorStateView.errorMessageMaxWidth)
            }
            if let action = action {
              Button(actionTitle) {
                action()
              }
              .buttonStyle(.borderedProminent)
              .foregroundColor(.invertedContrastColor)
              .disabled(isLoading)
            }
          }
          .padding(.top, Constants.ErrorStateView.verticalStackTopPadding)

          Spacer(minLength: Constants.ErrorStateView.minSpacerLength)
          Spacer(minLength: Constants.ErrorStateView.minSpacerLength)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: geo.size.height)
      }
      .background(Color.backgroundColor)
    }
  }
}

struct NetworkStatusView: View {
  @StateObject private var networkMonitor = NetworkMonitor()

  var body: some View {
    HStack {
      (networkMonitor.isNetworkAvailable ? Image.wifi : Image.wifiSlash)
        .foregroundColor(networkMonitor.isNetworkAvailable ? .green : .red)
      Text(
        networkMonitor.isNetworkAvailable ?
        Constants.ErrorStateView.networkOnlineTitle :
          Constants.ErrorStateView.networkOfflineTitle
      )
      .footnoteStyle()
      .multilineTextAlignment(.center)
      .opacity(Constants.ErrorStateView.networkStatusOpacity)
    }
    .task {
      await networkMonitor.startMonitoring()
    }
  }
}

struct ErrorStateView_Previews: PreviewProvider {
  static var previews: some View {
    ErrorStateView(isLoading: true, state: .requestError) {}
    ErrorStateView(state: .requestError) {}
    ErrorStateView(state: .emptyCart, actionTitle: "Go shopping") {}
    ErrorStateView(state: .emptyProductGroup)
  }
}
