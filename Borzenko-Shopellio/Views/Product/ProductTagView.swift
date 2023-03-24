//
//  ProductTagView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductTagView: View {
  var tag: String

  var body: some View {
    Text(tag.uppercased())
      .font(.caption)
      .foregroundColor(.backgroundColor)
      .padding(.horizontal, Constants.Product.tagHorizontalPadding)
      .background(
        RoundedRectangle(cornerRadius: Constants.Product.tagCornerRadius)
          .fill(Color.textColor)
      )
  }
}

struct ProductTagView_Previews: PreviewProvider {
  static var previews: some View {
    ProductTagView(tag: Constants.Product.newArrivalTag)
  }
}
