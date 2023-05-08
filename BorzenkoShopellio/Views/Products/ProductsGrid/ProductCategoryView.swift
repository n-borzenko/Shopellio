//
//  ProductCategoryView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 05/05/2023.
//

import SwiftUI

struct ProductCategoryView: View {
  @EnvironmentObject var products: Products
  @State private var selectedSubcategoryId = Constants.ProductsGrid.allPickerLabel
  @State private var filteredProducts: [Product] = []
  var category: ProductCategory

  var body: some View {
    ProductsGridView(products: $filteredProducts)
      .navigationDestination(for: Product.self) { product in
        ProductDetailsView(product: product)
      }
      .navigationTitle(category.title)
      .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Picker(
            Constants.ProductsGrid.subcategoryPickerLabel,
            selection: $selectedSubcategoryId
          ) {
            Text(Constants.ProductsGrid.allSubcategoriesLabel)
              .tag(Constants.ProductsGrid.allPickerLabel)
            ForEach(category.subcategories) { subcategory in
              Text(subcategory.title)
            }
          }
          .pickerStyle(.menu)
        }
      }
      .onChange(of: selectedSubcategoryId) { subcategoryId in
        filteredProducts = products.filterProducts(
          categoryId: category.id,
          subcategoryId: subcategoryId == Constants.ProductsGrid.allPickerLabel ? nil : subcategoryId
        )
      }
      .onAppear {
        filteredProducts = products.filterProducts(
          categoryId: category.id,
          subcategoryId: selectedSubcategoryId == Constants.ProductsGrid.allPickerLabel ? nil :
            selectedSubcategoryId
        )
      }
  }
}

struct ProductCategoryView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ProductCategoryView(category: SampleData.shop.categories[0])
    }
    .environmentObject(SampleData.shop)
    .environmentObject(SampleData.products)
    .environmentObject(Router())
  }
}
