//
//  HomeView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 18/02/2023.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack {
      Color.backgroundColor
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: Constants.Home.verticalSpacing) {
        HomeTopView()
        Image(Constants.Images.logoLarge)
        WelcomeTextView(text: Constants.Home.welcomeText)
        Spacer()
      }
    }
  }
}

struct HomeTopView: View {
  @State private var onboardingIsShown = false
  
  var body: some View {
    HStack {
      Spacer()
      Button(action: {
        onboardingIsShown = true
      }) {
        ImageCircleView(systemName: Constants.Images.infoCircle)
      }
      .sheet(isPresented: $onboardingIsShown, onDismiss: {}) {
        OnboardingView(onboardingIsShown: $onboardingIsShown)
      }
    }
    .padding([.leading, .trailing, .top])
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
