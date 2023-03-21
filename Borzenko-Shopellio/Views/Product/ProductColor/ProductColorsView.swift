//
//  ProductColorsView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductColorsView: View {
  @EnvironmentObject var shop: Shop
  var colors: [String]
  var isLimited = true

  var colorNames: [String] {
    isLimited ? Array(colors.prefix(Constants.Product.colorCircleLimit)) : colors
  }

  var body: some View {
    HStack {
      ForEach(colorNames, id: \.self) { colorName in
        ProductColorView(colorName: colorName)
      }
      if isLimited && colors.count > Constants.Product.colorCircleLimit {
        Image.plusCircle
          .resizable()
          .scaledToFit()
          .frame(
            width: Constants.Product.colorCircleSmallSize,
            height: Constants.Product.colorCircleSmallSize
          )
          .foregroundColor(.accentColor)
      }
    }
  }
}

struct ProductColorsView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ProductColorsView(colors: ["white", "black", "navy blue"])
      ProductColorsView(
        colors: ["white", "black", "gray", "red", "blue", "green", "steel blue"]
      )
      ProductColorsView(
        colors: ["white", "black", "gray", "red", "blue", "green", "steel blue"],
        isLimited: false
      )
    }
    .environmentObject(SampleData.shop)
  }
}
