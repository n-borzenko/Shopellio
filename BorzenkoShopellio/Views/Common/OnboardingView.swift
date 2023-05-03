//
//  OnboardingView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 03/05/2023.
//

import SwiftUI

enum OnboardingPage: Int {
  case first = 1
  case second
  case third

  var title: String {
    switch self {
    case .first: return Constants.OnboardingView.page1Title
    case .second: return Constants.OnboardingView.page2Title
    case .third: return Constants.OnboardingView.page3Title
    }
  }

  var subtitle: String {
    switch self {
    case .first: return Constants.OnboardingView.page1Subtitle
    case .second: return Constants.OnboardingView.page2Subtitle
    case .third: return Constants.OnboardingView.page3Subtitle
    }
  }

  var imageName: String {
    switch self {
    case .first: return Constants.OnboardingView.page1Image
    case .second: return Constants.OnboardingView.page2Image
    case .third: return Constants.OnboardingView.page3Image
    }
  }
}

struct OnboardingView: View {
  @State private var selectedPage = OnboardingPage.first
  var completionHandler: () -> Void

  var body: some View {
    GeometryReader { geo in
      VStack {
        TabView(selection: $selectedPage) {
          OnboardingPageView(page: .first, maxImageHeight: geo.size.height / 2)
            .tag(OnboardingPage.first)
          OnboardingPageView(page: .second, maxImageHeight: geo.size.height / 2)
            .tag(OnboardingPage.second)
          OnboardingPageView(page: .third, maxImageHeight: geo.size.height / 2)
            .tag(OnboardingPage.third)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
          UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.accentColor)
          UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.accentColor)
            .withAlphaComponent(Constants.OnboardingView.pageIndicatorOpacity)
        }
      }
      .padding()
      .frame(maxWidth: .infinity, minHeight: geo.size.height)
      .background(Color.backgroundColor)
      .overlay {
        VStack {
          Spacer()
          if selectedPage == .third {
            HStack {
              Spacer()
              Button(
                Constants.OnboardingView.startButtonTitle,
                action: completionHandler
              )
                .buttonStyle(.borderedProminent)
                .foregroundColor(.invertedContrastColor)
            }
          } else {
            HStack {
              Button(
                Constants.OnboardingView.skipButtonTitle,
                action: completionHandler
              )
                .tint(.accentColor)
              Spacer()
              Button(Constants.OnboardingView.nextButtonTitle) {
                if let nextPage = OnboardingPage(rawValue: selectedPage.rawValue + 1) {
                  selectedPage = nextPage
                }
              }
              .buttonStyle(.bordered)
              .tint(.accentColor)
            }
          }
        }
        .padding()
      }
    }
  }
}

struct OnboardingPageView: View {
  var page: OnboardingPage
  var maxImageHeight: Double

  var body: some View {
    VStack {
      Image(page.imageName)
        .resizable()
        .scaledToFit()
        .frame(
          maxWidth: Constants.OnboardingView.imageMaxWidth,
          maxHeight: maxImageHeight
        )
      VStack {
        Text(page.title)
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.textColor)
          .frame(maxWidth: Constants.OnboardingView.textMaxWidth)
        Text(page.subtitle)
          .multilineTextAlignment(.center)
          .foregroundColor(.textColor)
          .frame(maxWidth: Constants.OnboardingView.textMaxWidth)
      }
      Spacer()
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView { }
  }
}
