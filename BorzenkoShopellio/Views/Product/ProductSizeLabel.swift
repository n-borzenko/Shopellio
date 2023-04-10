//
//  ProductSizeLabel.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductSizeLabel: View {
  @EnvironmentObject var shop: Shop
  var sizeName: String
  var isNameVisible = false
  var scale = ProductSubviewScale.small
  var isUnavailable = false
  var isLimited = true

  var body: some View {
    HStack {
      if scale == .small {
        Text(sizeName.uppercased())
          .font(.callout)
          .fontWeight(.semibold)
          .strikethrough(isUnavailable)
          .foregroundColor(.textColor)
          .padding(.horizontal, Constants.Product.sizeLabelSmallHorizontalPadding)
          .padding(.vertical, Constants.Product.sizeLabelSmallVerticalPadding)
          .frame(maxWidth: isLimited ? .none : .infinity)
          .background(
            RoundedRectangle(
              cornerRadius: Constants.Product.sizeLabelSmallCornerRadius
            )
            .strokeBorder(Color.textColor, lineWidth: Constants.Product.sizeLabelBorderWidth)
          )
          .opacity(
            isUnavailable ? Constants.Product.sizeLabelUnavailableOpacity :
              Constants.Product.sizeLabelDefaultOpacity
          )
      } else {
        Text(sizeName.uppercased())
          .font(.body)
          .fontWeight(.semibold)
          .strikethrough(isUnavailable)
          .foregroundColor(.textColor)
          .padding(.horizontal, Constants.Product.sizeLabelLargeHorizontalPadding)
          .padding(.vertical, Constants.Product.sizeLabelLargeVerticalPadding)
          .frame(maxWidth: isLimited ? .none : .infinity)
          .background(
            RoundedRectangle(
              cornerRadius: Constants.Product.sizeLabelLargeCornerRadius
            )
            .strokeBorder(Color.textColor, lineWidth: Constants.Product.sizeLabelBorderWidth)
          )
          .opacity(
            isUnavailable ? Constants.Product.sizeLabelUnavailableOpacity :
              Constants.Product.sizeLabelDefaultOpacity
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
      ProductSizeLabel(sizeName: "XS", isNameVisible: true, isUnavailable: true)
      ProductSizeLabel(sizeName: "XS", isNameVisible: true, isLimited: false)
      ProductSizeLabel(sizeName: "XXL", scale: .large)
      ProductSizeLabel(sizeName: "XXL", isNameVisible: true, scale: .large)
      ProductSizeLabel(sizeName: "XXL", isNameVisible: true, scale: .large, isUnavailable: true)
      ProductSizeLabel(sizeName: "XXL", isNameVisible: true, scale: .large, isLimited: false)
    }
    .environmentObject(Shop.createFromFile())
  }
}
