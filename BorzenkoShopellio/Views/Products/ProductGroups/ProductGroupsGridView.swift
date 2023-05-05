//
//  ProductGroupsGridView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 31/03/2023.
//

import SwiftUI

struct ProductGroupsGridView: View {
  @EnvironmentObject var shop: Shop
  private let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]

  var body: some View {
    LazyVGrid(columns: columns, alignment: .leading) {
      Section(
        header: ProductGroupHeaderView(
          title: Constants.ProductGroups.collectionsTitle
        )
      ) {
        ForEach(shop.collections) { collection in
          NavigationLink(value: collection) {
            ProductGroupsCellView(group: collection)
              .frame(
                maxWidth: .infinity,
                minHeight: Constants.ProductGroups.cellMinHeight
              )
          }
        }
      }
      Section(
        header: ProductGroupHeaderView(
          title: Constants.ProductGroups.categoriesTitle
        )
      ) {
        ForEach(shop.categories) { category in
          let label = category.subcategories.count != 1 ? Constants.ProductGroups.subcategoriesLabel :
          Constants.ProductGroups.subcategoryLabel
          NavigationLink(value: category) {
            ProductGroupsCellView(
              group: category,
              footnote: "\(category.subcategories.count) \(label)"
            )
            .frame(
              maxWidth: .infinity,
              minHeight: Constants.ProductGroups.cellMinHeight
            )
          }
        }
      }
    }
  }
}

struct ProductGroupHeaderView: View {
  var title: String

  var body: some View {
    HStack {
      Text(title)
        .font(.title2)
        .foregroundColor(.textColor)
        .fontWeight(.bold)
      Spacer()
    }
  }
}

struct ProductGroupsGridView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ScrollView {
        ProductGroupsGridView()
          .environmentObject(SampleData.shop)
          .padding()
      }
      .background(Color.backgroundColor)
    }
  }
}
