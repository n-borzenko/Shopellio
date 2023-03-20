//
//  CartRowView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct CartRowView: View {
  var item: CartItem
  @EnvironmentObject var shop: Shop

  func getPriceString(_ price: Decimal) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(for: price) ?? Constants.General.unavailableString
  }

  var body: some View {
    VStack(alignment: .leading) {
      Text(item.product.title)
      ProductPriceTextView(product: item.product)
      HStack {
        HStack {
          Text(Constants.Cart.rowColorLabel)
          Circle()
            .strokeBorder(
              Color.textColor,
              lineWidth: Constants.Products.colorCircleBorderWidth
            )
            .background(Circle().fill(
              Color(hex: shop.colors[item.variant.color] ?? "") ?? .clear)
            )
            .frame(
              width: Constants.Products.colorCircleRowSize,
              height: Constants.Products.colorCircleRowSize
            )
          Text(item.variant.color.capitalized)
        }
        Spacer()
        Text(Constants.Cart.rowSizeLabel)
        Text(item.variant.size)
        Spacer()
      }
      HStack {
        Text(Constants.Cart.rowCountLabel)
        Text("\(item.count)")
        Spacer()
      }
    }
  }
}

struct CartRowView_Previews: PreviewProvider {
  static var previews: some View {
    CartRowView(item: CartItem(
      product: SampleData.products[0],
      variant: SampleData.products[0].stock[0].variant,
      count: 2
    ))
    .environmentObject(SampleData.shop)
  }
}
