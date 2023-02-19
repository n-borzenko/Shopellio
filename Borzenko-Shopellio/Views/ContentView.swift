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
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 20) {
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
        Circle().frame(width: 20, height: 20).foregroundColor(.accentColor)
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
