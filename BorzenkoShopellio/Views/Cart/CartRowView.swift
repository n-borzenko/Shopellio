//
//  CartRowView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct CartRowView: View {
  var item: CartItem
  @EnvironmentObject var shop: Shop

  var body: some View {
    VStack(alignment: .leading) {
      Text(item.product.title)
        .font(.title3)
        .lineLimit(Constants.Cart.titleRowLineLimit)
        .foregroundColor(.textColor)
      ProductPriceContainerView(product: item.product)
      HStack {
        ProductColorView(colorName: item.variant.color, isNameVisible: true)
        ProductSizeLabel(sizeName: item.variant.size, isNameVisible: true)
        Spacer()
        Image.xCircleFill
          .foregroundColor(.accentColor)
        Text("\(item.quantity)")
          .fontWeight(.bold)
          .foregroundColor(.textColor)
      }
    }
  }
}

struct CartRowView_Previews: PreviewProvider {
  static var previews: some View {
    CartRowView(item: CartItem(
      product: Shop.createFromFile().products[0],
      variant: Shop.createFromFile().products[0].stock[0].variant,
      quantity: 2
    ))
    .environmentObject(Shop.createFromFile())
  }
}
