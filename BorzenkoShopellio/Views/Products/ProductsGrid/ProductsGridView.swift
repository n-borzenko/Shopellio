//
//  ProductsGridView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductsGridView: View {
  @EnvironmentObject var router: Router
  @Binding var products: [Product]
  private let columns = [
    GridItem(.adaptive(
      minimum: Constants.ProductsGrid.gridItemMinWidth,
      maximum: Constants.ProductsGrid.gridItemMaxWidth
    ))
  ]

  var body: some View {
    if products.isEmpty {
      ErrorStateView(state: .emptyProductGroup)
    } else {
      ScrollViewReader { proxy in
        ScrollView {
          LazyVGrid(columns: columns) {
            ForEach(products) { product in
              NavigationLink(value: product) {
                ProductsCellView(product: product)
                  .aspectRatio(
                    Constants.ProductsGrid.cellAspectRatio,
                    contentMode: .fit
                  )
              }
              .id(product.id)
            }
          }
          .padding()
          .onChange(of: products) { _ in
            Task {
              try await Task.sleep(
                for: .milliseconds(Constants.ProductsGrid.scrollTimeout)
              )
              await MainActor.run {
                proxy.scrollTo(products.first?.id)
              }
            }
          }
        }
      }
      .background(Color.backgroundColor)
      .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
    }
  }
}

struct ProductsCellView: View {
  var product: Product

  var body: some View {
    VStack(alignment: .leading) {
      ProductImageView(imageUrl: product.imageUrls.first)
      Divider()
      VStack(alignment: .leading) {
        Text(product.title)
          .defaultStyle()
          .lineLimit(Constants.ProductsGrid.titleRowLineLimit)
        HStack {
          ProductPriceContainerView(product: product)
          if product.tags.contains(Constants.Product.newArrivalTag) {
            ProductTagView(tag: Constants.Product.newArrivalTag)
          }
        }
        ProductColorsView(colors: product.colors)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .padding(Constants.ProductsGrid.cellPadding)
    .background(Color.cellBackgroundColor)
    .clipShape(RoundedRectangle(cornerRadius: Constants.ProductsGrid.cellCornerRadius))
  }
}

struct ProductsGridView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ProductsGridView(products: .constant(SampleData.products.allItems))
    }
    .environmentObject(SampleData.shop)
    .environmentObject(Router())
  }
}
