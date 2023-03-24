//
//  CartContentSectionView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct CartContentSectionView: View {
  @EnvironmentObject var cart: Cart

  var body: some View {
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
}

struct CartContentSectionView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      CartContentSectionView()
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
