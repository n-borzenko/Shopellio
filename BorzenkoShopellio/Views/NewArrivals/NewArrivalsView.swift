//
//  NewArrivalsView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct NewArrivalsView: View {
  @EnvironmentObject var shop: Shop
  @State private var selectedCategoryId: String = ""

  var categories: [ProductCategory] {
    shop.orderedCategoryIds.compactMap { shop.categories[$0] }
  }

  private var filteredProducts: [Product] {
    shop.products.filter { product in
      guard
        let subcategory = shop.subcategories[product.subcategoryId],
        product.tags.contains(Constants.Product.newArrivalTag) else {
        return false
      }
      return subcategory.categoryId == selectedCategoryId
    }
  }

  var body: some View {
    NavigationStack {
      ProductGridView(products: filteredProducts)
      .navigationDestination(for: Product.self) { product in
        ProductDetailsView(product: product)
      }
      .navigationTitle(Constants.NewArrivals.navigationTitle)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Picker(
            Constants.NewArrivals.categoryPickerLabel,
            selection: $selectedCategoryId
          ) {
            ForEach(categories) { category in
              Text(category.title)
            }
          }
          .pickerStyle(.segmented)
        }
      }
      .onAppear {
        DispatchQueue.main.async {
          if self.selectedCategoryId.isEmpty && !self.categories.isEmpty {
            self.selectedCategoryId = self.categories[0].id
          }
        }
      }
    }
  }
}

struct NewArrivalsView_Previews: PreviewProvider {
  static var previews: some View {
    NewArrivalsView()
      .environmentObject(Shop.createFromFile())
  }
}
