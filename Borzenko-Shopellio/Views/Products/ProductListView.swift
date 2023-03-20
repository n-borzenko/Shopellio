//
//  ProductListView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductListView: View {
  var products: [Product]

  var body: some View {
    List(products) { product in
      NavigationLink(value: product) {
        ProductsRowView(product: product)
      }
      .alignmentGuide(.listRowSeparatorLeading) { _ in
        return 0
      }
    }
    .listStyle(.insetGrouped)
    .scrollContentBackground(.hidden)
    .background(Color.backgroundColor)
  }
}


struct ProductListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ProductListView(products: SampleData.products)
    }
    .environmentObject(SampleData.shop)
  }
}
