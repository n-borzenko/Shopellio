//
//  HomeView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 18/02/2023.
//

import SwiftUI

struct HomeView: View {
  @StateObject private var cart = Cart(items: [])

  var body: some View {
    ZStack {
      Color.backgroundColor
        .edgesIgnoringSafeArea(.all)

      VStack(spacing: Constants.Home.verticalSpacing) {
        HomeTopView()
        ProductListView(cart: cart)
      }
    }
  }
}

struct HomeTopView: View {
  @State private var onboardingIsShown = false

  var body: some View {
    HStack {
      Image.logoLarge
      Spacer()
      Button(action: {
        onboardingIsShown = true
      }, label: {
        Image.infoCircle
          .gradientCircle()
      })
      .sheet(isPresented: $onboardingIsShown, onDismiss: {}, content: {
        OnboardingView(onboardingIsShown: $onboardingIsShown)
      })
    }
    .padding([.leading, .trailing, .top])
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
