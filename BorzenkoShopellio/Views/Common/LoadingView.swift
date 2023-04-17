//
//  LoadingView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 14/04/2023.
//

import SwiftUI

enum LoadingViewScale {
  case small
  case large
}

struct LoadingView: View {
  var scale = LoadingViewScale.small
  @State private var angle = Constants.LoadingView.endAngle

  private var radius: Double {
    return scale == .large ?
    Constants.LoadingView.largeRadius :
    Constants.LoadingView.smallRadius
  }

  private var maxSize: Double {
    return scale == .large ?
    Constants.LoadingView.largeMaxSize :
    Constants.LoadingView.smallMaxSize
  }

  private var indexScale: Double {
    return scale == .large ?
    Constants.LoadingView.largeIndexScale :
    Constants.LoadingView.smallIndexScale
  }

  var body: some View {
    ZStack {
      ForEach(0..<Constants.LoadingView.dotsCount, id: \.self) { index in
        Circle()
          .frame(
            width: maxSize - Double(index) * indexScale,
            height: maxSize - Double(index) * indexScale
          )
          .offset(y: -radius)
          .rotationEffect(.degrees(angle + Double(index) * radius), anchor: .center)
          .foregroundColor(.accentColor)
      }
    }
    .frame(
      width: (radius + maxSize) * 2.0,
      height: (radius + maxSize) * 2.0
    )
    .onAppear {
      withAnimation(
        .easeInOut(duration: Constants.LoadingView.animationDuration)
        .repeatForever(autoreverses: false)
      ) {
        // Week09 new animation, but the old one was deleted
        angle = Constants.LoadingView.startAngle
      }
    }
  }
}

struct LoadingView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      LoadingView(scale: .large)
      LoadingView()
    }
  }
}
