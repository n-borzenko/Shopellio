//
//  ProductColorView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductColorView: View {
  @EnvironmentObject var shop: Shop
  var colorName: String
  var isNameVisible = false
  var scale = ProductSubviewScale.small

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
        .background(Circle().fill(color)
        )
        .frame(width: diameter, height: diameter)
      if isNameVisible {
        Text(colorName.capitalized)
          .foregroundColor(.textColor)
          .font(scale == .small ? .callout : .title3)
          .fontWeight(.semibold)
      }
    }
  }
}

struct ProductColorView_Previews: PreviewProvider {
  static var previews: some View {
    VStack(alignment: .leading) {
      ProductColorView(colorName: "red")
      ProductColorView(colorName: "red", isNameVisible: true)
      ProductColorView(colorName: "navy blue", scale: .large)
      ProductColorView(colorName: "navy blue", isNameVisible: true, scale: .large)
    }
    .environmentObject(SampleData.shop)
  }
}
