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

  var body: some View {
    NavigationStack(path: $router.newArrivalsPath) {
      ProductGridView(products: products.filteredItems)
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
//      .onChange(of: products.state) { _ in
//        guard products.state == .finished else { return }
//        products.filterItems()
//      }
      .onAppear {
        products.filterItems()

//        DispatchQueue.main.async {
//          if self.selectedCategoryId.isEmpty && !self.categories.isEmpty {
//            self.selectedCategoryId = self.categories[0].id
//          }
//        }
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
