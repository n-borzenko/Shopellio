//
//  ButtonContentViews.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import SwiftUI

extension Image {
  func gradientCircle() -> some View {
    self
      .frame(
        width: Constants.General.circularButtonWidth,
        height: Constants.General.circularButtonHeight)
      .font(.title)
      .foregroundColor(.buttonTextColor)
      .background(
        ZStack {
          Color.accentColor
          LinearGradient(
            colors: [.white.opacity(Constants.General.buttonGradientOpacity), .clear],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        }
          .clipShape(Circle())
      )
  }
}

struct ButtonContentViews_Previews: PreviewProvider {
  static var previews: some View {
    Image.infoCircle
      .gradientCircle()
  }
}
