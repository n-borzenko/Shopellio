//
//  CartView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct CartView: View {
  @State private var products = SampleData.products
  @EnvironmentObject var shop: Shop
  @State private var selectedCategory: String = ""

  private var filteredProducts: [Product] {
    products.filter { product in
      guard
        let subcategory = shop.subcategories[product.subcategoryId],
        product.tags.contains(Constants.General.newArrivalTag) else {
        return false
      }
      return subcategory.categoryId == selectedCategory
    }
  }

  var body: some View {
    NavigationStack {
      ProductListView(products: filteredProducts)
      .navigationDestination(for: Product.self) { product in
        ProductDetailsView(product: product)
      }
      .navigationTitle(Constants.NewArrivals.navigationTitle)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Picker("Category", selection: $selectedCategory) {
            ForEach(shop.orderedCategoryIds, id: \.self) { categoryId in
              Text(shop.categories[categoryId]?.title ?? categoryId)
            }
          }
          .pickerStyle(.segmented)
        }
      }
      .onAppear {
        DispatchQueue.main.async {
          if self.selectedCategory.isEmpty && !self.shop.orderedCategoryIds.isEmpty {
            self.selectedCategory = self.shop.orderedCategoryIds.first ?? ""
          }
        }
      }
    }
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
      .environmentObject(SampleData.shop)
  }
}
