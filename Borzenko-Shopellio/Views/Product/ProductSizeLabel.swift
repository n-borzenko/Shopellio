//
//  ProductSizeLabel.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductSizeLabel: View {
  @EnvironmentObject var shop: Shop
  var sizeName: String
  var isNameVisible = false
  var scale = ProductSubviewScale.small

  var body: some View {
    HStack {
      if scale == .small {
        Text(sizeName.uppercased())
          .font(.callout)
          .fontWeight(.semibold)
          .foregroundColor(.textColor)
          .padding(.horizontal, Constants.Product.sizeLabelSmallHorizontalPadding)
          .padding(.vertical, Constants.Product.sizeLabelSmallVerticalPadding)
          .background(
            RoundedRectangle(
              cornerRadius: Constants.Product.sizeLabelSmallCornerRadius
            )
            .strokeBorder(Color.textColor, lineWidth: 1)
          )
      } else {
        Text(sizeName.uppercased())
          .font(.body)
          .fontWeight(.semibold)
          .foregroundColor(.textColor)
          .padding(.horizontal, Constants.Product.sizeLabelLargeHorizontalPadding)
          .padding(.vertical, Constants.Product.sizeLabelLargeVerticalPadding)
          .background(
            RoundedRectangle(
              cornerRadius: Constants.Product.sizeLabelLargeCornerRadius
            )
            .strokeBorder(Color.textColor, lineWidth: 1)
          )
      }
      if isNameVisible {
        Text("Size")
          .foregroundColor(.textColor)
          .font(scale == .small ? .callout : .title3)
          .fontWeight(.semibold)
      }
    }
  }
}

struct ProductSizeLabel_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ProductSizeLabel(sizeName: "M")
      ProductSizeLabel(sizeName: "XS", isNameVisible: true)
      ProductSizeLabel(sizeName: "XXL", scale: .large)
      ProductSizeLabel(sizeName: "XXL", isNameVisible: true, scale: .large)
    }
    .environmentObject(SampleData.shop)
  }
}
