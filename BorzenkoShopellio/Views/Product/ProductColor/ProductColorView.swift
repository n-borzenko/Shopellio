//
//  ProductColorView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductColorView: View {
  @EnvironmentObject var shop: Shop
  var colorName: String
  var isNameVisible = false
  var scale = ProductSubviewScale.small
  var isUnavailable = false

  var color: Color {
    Color(hex: shop.colors[colorName] ?? "") ?? .clear
  }

  var diameter: Double {
    scale == .small ? Constants.Product.colorCircleSmallSize : Constants.Product.colorCircleLargeSize
  }

  var body: some View {
    HStack {
      Circle()
        .strokeBorder(
          Color.textColor,
          lineWidth: Constants.Product.colorCircleBorderWidth
        )
        .background(Circle().fill(color))
        .frame(width: diameter, height: diameter)
        .overlay(
          isUnavailable ? Line()
            .stroke(
              LinearGradient(
                gradient: Gradient(stops: [
                  Gradient.Stop(color: .textColor, location: Constants.Product.colorCircleGradientStops[0]),
                  Gradient.Stop(color: .backgroundColor, location: Constants.Product.colorCircleGradientStops[1]),
                  Gradient.Stop(color: .backgroundColor, location: Constants.Product.colorCircleGradientStops[2]),
                  Gradient.Stop(color: .textColor, location: Constants.Product.colorCircleGradientStops[3])
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              ),
              lineWidth: scale == .small ? Constants.Product.colorCircleSmallLineWidth :
                Constants.Product.colorCircleLargeLineWidth
            )
            .clipShape(Circle())
          : nil
        )
      if isNameVisible {
        Text(colorName.capitalized)
          .foregroundColor(.textColor)
          .font(scale == .small ? .callout : .title3)
          .fontWeight(.semibold)
      }
    }
  }
}

struct Line: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: rect.height))
    path.addLine(to: CGPoint(x: rect.width, y: 0))
    return path
  }
}

struct ProductColorView_Previews: PreviewProvider {
  static var previews: some View {
    VStack(alignment: .leading) {
      ProductColorView(colorName: "red")
      ProductColorView(colorName: "red", isUnavailable: true)
      ProductColorView(colorName: "red", isNameVisible: true)
      ProductColorView(colorName: "gray", scale: .large)
      ProductColorView(colorName: "gray", scale: .large, isUnavailable: true)
      ProductColorView(colorName: "gray", isNameVisible: true, scale: .large)
    }
    .environmentObject(SampleData.shop)
  }
}
