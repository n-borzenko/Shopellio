//
//  CartSummarySectionView.swift
//  Borzenko-Shopellio
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
        Text("\(cart.totalItemCount)")
          .fontWeight(.bold)
          .foregroundColor(.textColor)
      }
      if !cart.items.isEmpty {
        if cart.discountedAmount > 0 {
          HStack {
            Text(Constants.Cart.summaryBeforeDiscount)
              .defaultStyle()
            Spacer()
            ProductPriceView(price: cart.totalAmountBeforeDiscount)
          }
          HStack {
            Text(Constants.Cart.summaryDiscountedAmount)
              .defaultStyle()
            Spacer()
            ProductPriceView(price: cart.discountedAmount)
          }
        }
        HStack {
          Text(Constants.Cart.summaryTotalAmount)
            .defaultStyle()
            .fontWeight(.bold)
          Spacer()
          ProductPriceView(price: cart.totalAmount)
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
    .environmentObject(SampleData.shop)
    .environmentObject(Cart(items: [
      CartItem(
        product: SampleData.products[0],
        variant: SampleData.products[0].stock[3].variant,
        count: 2
      ),
      CartItem(
        product: SampleData.products[1],
        variant: SampleData.products[1].stock[2].variant,
        count: 1
      )
    ]))
  }
}
