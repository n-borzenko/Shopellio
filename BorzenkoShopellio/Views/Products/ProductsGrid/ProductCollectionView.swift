//
//  ProductCollectionView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 05/05/2023.
//

import SwiftUI

struct ProductCollectionView: View {
  @EnvironmentObject var shop: Shop
  @EnvironmentObject var products: Products
  @State private var selectedCategoryId = Constants.ProductsGrid.allPickerLabel
  @State private var filteredProducts: [Product] = []
  var collection: ProductCollection

  var body: some View {
    ProductsGridView(products: $filteredProducts)
      .navigationDestination(for: Product.self) { product in
        ProductDetailsView(product: product)
      }
      .navigationTitle(collection.title)
      .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Picker(
            Constants.ProductsGrid.categoryPickerLabel,
            selection: $selectedCategoryId
          ) {
            Text(Constants.ProductsGrid.allPickerLabel)
              .tag(Constants.ProductsGrid.allPickerLabel)
            ForEach(shop.categories) { category in
              Text(category.title)
            }
          }
          .pickerStyle(.segmented)
        }
      }
      .onAppear {
        filteredProducts = products.filterProducts(
          collectionId: collection.id,
          categoryId: selectedCategoryId == Constants.ProductsGrid.allPickerLabel ? nil : selectedCategoryId
        )
      }
      .onChange(of: selectedCategoryId) { selectedCategoryId in
        filteredProducts = products.filterProducts(
          collectionId: collection.id,
          categoryId: selectedCategoryId == Constants.ProductsGrid.allPickerLabel ? nil : selectedCategoryId
        )
      }
  }
}

struct ProductCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ProductCollectionView(collection: SampleData.shop.collections[0])
    }
    .environmentObject(SampleData.shop)
    .environmentObject(SampleData.products)
    .environmentObject(Router())
  }
}
