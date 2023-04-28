//
//  ProductPriceTextView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductPriceView: View {
  var price: Decimal
  var isOld = false
  var isHighlighted = false

  var body: some View {
    Text(Product.getPriceString(price))
      .fontWeight(.bold)
      .strikethrough(isOld)
      .foregroundColor(isHighlighted ? .red : .textColor)
  }
}

struct ProductPriceContainerView: View {
  var product: Product

  var body: some View {
    HStack {
      if product.discount > 0 {
        ProductPriceView(price: product.price, isOld: true)
        ProductPriceView(price: product.discountedPrice, isHighlighted: true)
      } else {
        ProductPriceView(price: product.price)
      }
    }
  }
}

struct ProductPriceTextView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ProductPriceContainerView(product: SampleData.products.allItems[0])
      ProductPriceContainerView(product: SampleData.products.allItems[1])
    }
  }
}
