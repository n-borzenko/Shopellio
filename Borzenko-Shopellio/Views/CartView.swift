//
//  CartView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 06/03/2023.
//

import SwiftUI

struct CartView: View {
  @ObservedObject var cart: Cart

  var body: some View {
    ScrollView {
      CartContentView(cart: cart)
        .padding([.horizontal, .bottom])
    }
    .navigationTitle(Constants.Cart.navigationTitle)
    .background(Color.backgroundColor)
  }
}

struct CartContentView: View {
  @ObservedObject var cart: Cart

  func getPriceString(price: Decimal) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(for: price) ?? Constants.General.unavailableString
  }

  var body: some View {
    VStack(alignment: .leading, spacing: Constants.Cart.itemListSpacing) {
      ForEach(cart.items, id: \.self.product.id) { item in
        VStack {
          HStack(alignment: .firstTextBaseline) {
            Text(item.product.name)
              .defaultStyle()
            Spacer()
            Text(getPriceString(price: item.product.price))
              .defaultStyle()
          }
          if item.count > 1 {
            HStack(alignment: .firstTextBaseline) {
              Text("x \(item.count)")
                .defaultStyle()
                .padding(.leading)
              Spacer()
              Text(getPriceString(price: item.product.price * Decimal(item.count)))
                .defaultStyle()
            }
          }
        }
      }

      HStack {
        Text(Constants.Cart.totalTitle)
          .defaultStyle()
          .fontWeight(.bold)
        Spacer()
        Text(getPriceString(price: cart.totalAmount))
          .defaultStyle()
          .fontWeight(.bold)
      }

      if let discountType = cart.discountType {
        HStack(alignment: .firstTextBaseline) {
          Text(Constants.Cart.discount)
            .defaultStyle()
            .padding(.leading)
          Spacer()
          Text("\(discountType) (" + "\(cart.discount * 100.0)" + "%)")
            .defaultStyle()
        }

        HStack {
          Text(Constants.Cart.totalAfterDiscountTitle)
            .defaultStyle()
            .fontWeight(.bold)
          Spacer()
          Text(getPriceString(price: cart.currentDiscountedAmount))
            .defaultStyle()
            .fontWeight(.bold)
        }
      }
    }
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      CartView(cart: Cart(items: [
        CartItem(product: ProductList.items[0], count: 1),
        CartItem(product: ProductList.items[3], count: 2)
      ]))
    }
  }
}
