//
//  ProductColorSelectionView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 24/03/2023.
//

import SwiftUI

struct ProductColorSelectionView: View {
  var colors: [String]
  var availableColors: Set<String>
  @Binding var selectedColorName: String?

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        if let color = selectedColorName {
          Text(Constants.ProductDetails.colorLabel)
            .defaultStyle()
          ProductColorView(colorName: color, isNameVisible: true)
        } else {
          Text(Constants.ProductDetails.selectColorLabel)
            .defaultStyle()
        }
      }

      ScrollView(.horizontal, showsIndicators: true) {
        HStack(spacing: Constants.ProductDetails.colorStackSpacing) {
          ForEach(colors, id: \.self) { color in
            Button {
              selectedColorName = color
            } label: {
              ProductColorView(
                colorName: color,
                scale: .large,
                isUnavailable: !availableColors.contains(color)
              )
              .frame(
                width: Constants.ProductDetails.colorSelectionWidth,
                height: Constants.ProductDetails.colorSelectionWidth
              )
              .overlay(
                (selectedColorName ?? "") == color ?
                Circle()
                  .strokeBorder(
                    lineWidth: Constants.ProductDetails.selectionBorderWidth
                  )
                : nil
              )
            }
          }
        }
        .padding(.bottom)
      }
    }
  }
}

struct ProductColorSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    ProductColorSelectionView(
      colors: SampleData.products[8].colors,
      availableColors: Set(
        SampleData.products[8].stock
          .filter { $0.variant.size == "M" }
          .map { $0.variant.color }
      ),
      selectedColorName: .constant(SampleData.products[8].stock[0].variant.color)
    )
    .environmentObject(SampleData.shop)
  }
}
