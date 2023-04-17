//
//  NewArrivalsView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct NewArrivalsView: View {
  @EnvironmentObject var shop: Shop
  @EnvironmentObject var products: Products
  @EnvironmentObject var router: Router
  @State private var selectedCategoryId: String = ""
  @State private var filteredProducts: [Product] = []

  var body: some View {
    NavigationStack(path: $router.newArrivalsPath) {
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
            ForEach(shop.categories) { category in
              Text(category.title)
            }
          }
          .pickerStyle(.segmented)
        }
      }
      .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
      .onChange(of: selectedCategoryId) { _ in
        filteredProducts = products.filterProducts(
          collectionId: "new",
          categoryId: selectedCategoryId
        )
      }
      .onAppear {
        Task {
          if self.selectedCategoryId.isEmpty && !self.shop.categories.isEmpty {
            self.selectedCategoryId = self.shop.categories[0].id
          }
        }
      }
    }
  }
}

struct NewArrivalsView_Previews: PreviewProvider {
  static var previews: some View {
    NewArrivalsView()
      .environmentObject(SampleData.shop)
      .environmentObject(SampleData.products)
      .environmentObject(Router())
  }
}
