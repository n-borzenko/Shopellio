//
//  ContentView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 18/02/2023.
//

import SwiftUI

struct ContentView: View {
  private let userName = "Natalia Borzenko"
  
  var body: some View {
    ZStack {
      Color.backgroundColor
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 40) {
        ContentTopView()
        Image("LogoLarge")
        WelcomeTextView(text: "Welcome,\n \(userName).")
        Spacer()
      }
    }
  }
}

struct ContentTopView: View {
  @State private var onboardingIsShown = false
  
  var body: some View {
    HStack {
      Spacer()
      Button(action: {
        onboardingIsShown = true
      }) {
        ImageCircleView(systemName: "info.circle")
      }
      .sheet(isPresented: $onboardingIsShown, onDismiss: {}) {
        OnboardingView(onboardingIsShown: $onboardingIsShown)
      }
    }
    .padding([.leading, .trailing, .top])
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
