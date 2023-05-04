//
//  ProductDetailsView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductDetailsView: View {
  @EnvironmentObject var shop: Shop
  @State private var isVariantSelectionShown = false
  var product: Product

  var body: some View {
    GeometryReader { proxy in
      Group {
        if proxy.size.width > Constants.ProductDetails.minWidthForVerticalGallery {
          HStack(alignment: .top, spacing: 0) {
            VerticalImageGallery(imageUrls: product.imageUrls)
              .frame(
                maxWidth: proxy.size.width / Constants.ProductDetails.imageWidthScale
              )
            Divider()
              .ignoresSafeArea(.container)
            ScrollView {
              ProductDetailsDescriptionView(
                isVariantSelectionShown: $isVariantSelectionShown,
                product: product
              )
            }
            .padding()
          }
        } else {
          ScrollView {
            HorizontalImageGallery(imageUrls: product.imageUrls)
              .frame(
                maxHeight: proxy.size.height / Constants.ProductDetails.imageHeightScale
              )
            Divider()
            ProductDetailsDescriptionView(
              isVariantSelectionShown: $isVariantSelectionShown,
              product: product
            )
            .padding()
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.backgroundColor)
      .sheet(isPresented: $isVariantSelectionShown) {
        NavigationStack {
          ProductVariantSelectionView(product: product)
        }
        .presentationDetents([.medium, .large])
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(Color.toolbarColor, for: .tabBar, .navigationBar)
    }
  }
}

struct ProductDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ProductDetailsView(product: SampleData.products.allItems[0])
    }
    .environmentObject(SampleData.shop)
    .environmentObject(SampleData.emptyCart)
  }
}
