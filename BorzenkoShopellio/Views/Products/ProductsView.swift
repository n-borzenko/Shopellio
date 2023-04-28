//
//  ProductsView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct ProductsView: View {
  @EnvironmentObject var shop: Shop
  @EnvironmentObject var products: Products
  @EnvironmentObject var router: Router
  @State private var selectedSubcategoryId: String?
  @State private var selectedProduct: Product?
  @State private var filteredProducts: [Product]?
  @State private var splitViewVisibility = NavigationSplitViewVisibility.doubleColumn

  var body: some View {
    NavigationSplitView {
      List(selection: $selectedSubcategoryId) {
        ForEach(shop.categories) { category in
          Section(header: Text(category.title)) {
            ForEach(category.subcategories) { subcategory in
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
        filteredProducts = products.filterProducts(
          subcategoryId: selectedSubcategoryId
        )
      }
    } content: {
      if selectedSubcategoryId != nil, let filteredProducts = filteredProducts {
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
        .navigationTitle("Subcategory")
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
      .environmentObject(SampleData.products)
      .environmentObject(Router())
  }
}
