//
//  ProductGroupsView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 05/05/2023.
//

import SwiftUI

struct ProductGroupsView: View {
  @EnvironmentObject var router: Router

  var body: some View {
    NavigationStack(path: $router.productsPath) {
      ScrollView {
        ProductGroupsGridView()
          .padding()
      }
      .navigationDestination(for: ProductCollection.self) { collection in
        ProductCollectionView(collection: collection)
      }
      .navigationDestination(for: ProductCategory.self) { category in
        ProductCategoryView(category: category)
      }
      .navigationTitle(Constants.ProductGroups.navigationTitle)
      .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
      .background(Color.backgroundColor)
    }
  }
}

struct ProductGroupsView_Previews: PreviewProvider {
  static var previews: some View {
    ProductGroupsView()
      .environmentObject(SampleData.shop)
      .environmentObject(SampleData.products)
      .environmentObject(Router())
  }
}
