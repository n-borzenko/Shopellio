//
//  CartView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 06/03/2023.
//

import SwiftUI

struct CartView: View {
  @Binding var cartIsShown: Bool
  @ObservedObject var cart: Cart

  var body: some View {
    ZStack {
      Color.backgroundColor
        .edgesIgnoringSafeArea(.all)

      VStack(spacing: Constants.Cart.verticalSpacing) {
        CartTopView(cartIsShown: $cartIsShown)

        ScrollView {
          CartContentView(cart: cart)
            .padding([.leading, .trailing, .bottom])
        }
      }
    }
  }
}

struct CartTopView: View {
  @Binding var cartIsShown: Bool

  var body: some View {
    HStack {
      Spacer()
      Button(action: {
        cartIsShown = false
      }, label: {
        ImageCircleView(systemName: Constants.Images.xmarkCircle)
      })
    }
    .padding([.leading, .trailing, .top])
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
      TitleTextView(text: Constants.Cart.listTitle)

      ForEach(cart.items, id: \.self.product.id) { item in
        VStack {
          HStack(alignment: .firstTextBaseline) {
            TextView(text: item.product.name)
            Spacer()
            TextView(text: getPriceString(price: item.product.price))
          }
          if item.count > 1 {
            HStack(alignment: .firstTextBaseline) {
              TextView(text: "x \(item.count)")
                .padding(.leading)
              Spacer()
              TextView(text: getPriceString(price: item.product.price * Decimal(item.count)))
            }
          }
        }
      }

      HStack {
        TextView(text: Constants.Cart.totalTitle)
          .fontWeight(.bold)
        Spacer()
        TextView(text: getPriceString(price: cart.totalAmount))
          .fontWeight(.bold)
      }

      if let discountType = cart.discountType {
        HStack(alignment: .firstTextBaseline) {
          TextView(text: Constants.Cart.discount)
            .padding(.leading)
          Spacer()
          TextView(text: "\(discountType) (\(cart.discount * 100.0)%)")
        }

        HStack {
          TextView(text: Constants.Cart.totalAfterDiscountTitle)
            .fontWeight(.bold)
          Spacer()
          TextView(text: getPriceString(price: cart.currentDiscountedAmount))
            .fontWeight(.bold)
        }
      }
    }
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView(cartIsShown: .constant(true), cart: Cart(items: [
      CartItem(product: ProductList.items[0], count: 1),
      CartItem(product: ProductList.items[3], count: 2)
    ]))
  }
}
