//
//  MainLoadingView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 13/04/2023.
//

import Foundation

import SwiftUI

struct MainLoadingView: View {
  @State private var isLoading = false

  var body: some View {
    ZStack {
      Color.backgroundColor
        .ignoresSafeArea()
      VStack {
        Spacer()
        Image.logoLarge
        if isLoading {
          Spacer()
          LoadingView(scale: .large)
        }
        Spacer()
      }
    }
    .onAppear {
      withAnimation(
        .easeIn(duration: Constants.Main.mainAnimationDuration)
      ) {
        // Week09 initial loading animation
        isLoading = true
      }
    }
  }
}

struct MainLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    MainLoadingView()
  }
}
