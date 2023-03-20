//
//  CartListView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct CartListView: View {
  @EnvironmentObject var cart: Cart

  var body: some View {
    List {
      if !cart.items.isEmpty {
        Section(header: Text(Constants.Cart.contentSectionTitle)) {
          ForEach(cart.items) { item in
            NavigationLink(value: item.product) {
              CartRowView(item: item)
            }
            .alignmentGuide(.listRowSeparatorLeading) { _ in
              return 0
            }
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
              Button {
                cart.removeProduct(product: item.product, variant: item.variant)
              } label: {
                Image.minusCircle
              }
              .tint(.accentColor)
              Button {
                cart.addProduct(product: item.product, variant: item.variant)
              } label: {
                Image.plusCircle
              }
              .tint(.accentColor)
            }
          }
          .onDelete { offsets in
            cart.removeItems(atOffsets: offsets)
          }
        }
      }
      CartSummarySection()
    }
    .listStyle(.insetGrouped)
    .scrollContentBackground(.hidden)
    .background(Color.backgroundColor)
  }
}

struct CartSummarySection: View {
  @EnvironmentObject var cart: Cart

  func getPriceString(_ price: Decimal) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(for: price) ?? Constants.General.unavailableString
  }

  var body: some View {
    Section(header: Text(Constants.Cart.summarySectionTitle)) {
      HStack {
        Text(Constants.Cart.summaryItemsCount)
        Spacer()
        Text("\(cart.totalItemCount)")
      }
      if cart.discountedAmount > 0 {
        HStack {
          Text(Constants.Cart.summaryBeforeDiscount)
          Spacer()
          Text(getPriceString(cart.totalAmountBeforeDiscount))
        }
        HStack {
          Text(Constants.Cart.summaryDiscountedAmount)
          Spacer()
          Text(getPriceString(cart.discountedAmount))
        }
      }
      HStack {
        Text(Constants.Cart.summarytotalAmount)
        Spacer()
        Text(getPriceString(cart.totalAmount))
      }
    }
  }
}

struct CartListView_Previews: PreviewProvider {
  static var previews: some View {
    CartListView()
      .environmentObject(SampleData.shop)
      .environmentObject(Cart(items: [
        CartItem(
          product: SampleData.products[0],
          variant: SampleData.products[0].stock[0].variant,
          count: 2
        )
      ]))
  }
}
