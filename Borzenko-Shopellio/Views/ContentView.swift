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
        Image("LogoLarge")
          .padding(.top, 100)
        Text("Welcome,\n \(userName).")
          .font(.headline)
          .kerning(0.4)
          .foregroundColor(Color("TextColor"))
          .multilineTextAlignment(.center)
          .lineSpacing(8)
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
