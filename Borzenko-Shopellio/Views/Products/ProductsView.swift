//
//  ProductsView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct ProductsView: View {
  @EnvironmentObject var shop: Shop
  @State private var products = SampleData.products
  @State private var selectedSubcategoryId: String?
  @State private var selectedProduct: Product?
  @State private var splitViewVisibility = NavigationSplitViewVisibility.doubleColumn

  var categories: [ProductCategory] {
    shop.orderedCategoryIds.compactMap { shop.categories[$0] }
  }

  func getSubcategories(category: ProductCategory) -> [ProductSubcategory] {
    category.subcategoryIds.compactMap { shop.subcategories[$0] }
  }

  var filteredProducts: [Product] {
    if let subcategoryId = selectedSubcategoryId {
      return products.filter { $0.subcategoryId == subcategoryId }
    } else {
      return []
    }
  }

  var body: some View {
    NavigationSplitView {
      List(selection: $selectedSubcategoryId) {
        ForEach(categories) { category in
          Section(header: Text(category.title)) {
            ForEach(getSubcategories(category: category)) { subcategory in
              NavigationLink(value: subcategory.id) {
                Text(subcategory.title)
              }
            }
          }
        }
      }
      .listStyle(.insetGrouped)
      .scrollContentBackground(.hidden)
      .background(Color.backgroundColor)
      .navigationTitle(Constants.Products.navigationTitle)
      .navigationBarTitleDisplayMode(.large)
      .onChange(of: selectedSubcategoryId) { _ in
        selectedProduct = nil
      }
    } content: {
      if
        let selectedSubcategoryId = selectedSubcategoryId,
        let selectedSubcategory = shop.subcategories[selectedSubcategoryId] {
        List(filteredProducts, selection: $selectedProduct) { product in
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
        .navigationTitle("\(selectedSubcategory.title)")
      } else {
        Text(Constants.Products.unselectedSubcategoryText)
      }
    } detail: {
      if let product = selectedProduct {
        ProductDetailsView(product: product)
      } else {
        Text(Constants.Products.unselectedProductText)
      }
    }
    .navigationSplitViewStyle(.balanced)
  }
}

struct ProductsView_Previews: PreviewProvider {
  static var previews: some View {
    ProductsView()
      .environmentObject(SampleData.shop)
  }
}
