//
//  ProductListView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 27/02/2023.
//

import SwiftUI

struct ProductListView: View {
  @State private var hideUncategorizedItems = false

  var products: [Product] {
    hideUncategorizedItems ? ProductList.items.filter { $0.category != nil } : ProductList.items
  }

  var body: some View {
    ScrollView {
      VStack(spacing: Constants.Product.listVerticalSpacing) {
        Toggle(isOn: $hideUncategorizedItems) {
          TextView(text: Constants.Product.toggleLabel)
        }
          .tint(.accentColor)
        ForEach(products) { product in
          ProductListItemView(product: product)
        }
      }
      .padding()
    }
  }
}

struct ProductListView_Previews: PreviewProvider {
  static var previews: some View {
    ProductListView()
  }
}
