//
//  CartSummarySectionView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct CartSummarySectionView: View {
  @EnvironmentObject var cart: Cart

  var body: some View {
    Section(header: Text(Constants.Cart.summarySectionTitle)) {
      HStack {
        Text(Constants.Cart.summaryItemsCount)
          .defaultStyle()
        Spacer()
        Text("\(cart.totalItemQuantity)")
          .fontWeight(.bold)
          .foregroundColor(.textColor)
          .accessibilityIdentifier(Constants.Identifiers.itemsCount)
      }
      if !cart.items.isEmpty {
        if cart.discountedAmount > 0 {
          HStack {
            Text(Constants.Cart.summaryBeforeDiscount)
              .defaultStyle()
            Spacer()
            ProductPriceView(price: cart.totalAmountBeforeDiscount)
              .accessibilityIdentifier(Constants.Identifiers.beforeDiscount)
          }
          HStack {
            Text(Constants.Cart.summaryDiscountedAmount)
              .defaultStyle()
            Spacer()
            ProductPriceView(price: cart.discountedAmount)
              .accessibilityIdentifier(
                Constants.Identifiers.discountedAmount
              )
          }
        }
        HStack {
          Text(Constants.Cart.summaryTotalAmount)
            .defaultStyle()
            .fontWeight(.bold)
          Spacer()
          ProductPriceView(price: cart.totalAmount)
            .accessibilityIdentifier(Constants.Identifiers.totalAmount)
        }
      }
    }
  }
}

struct CartSummarySectionView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      CartSummarySectionView()
    }
    .environmentObject(Shop.createFromFile())
    .environmentObject(Cart(items: [
      CartItem(
        product: Shop.createFromFile().products[0],
        variant: Shop.createFromFile().products[0].stock[3].variant,
        quantity: 2
      ),
      CartItem(
        product: Shop.createFromFile().products[1],
        variant: Shop.createFromFile().products[1].stock[2].variant,
        quantity: 1
      )
    ]))
  }
}
