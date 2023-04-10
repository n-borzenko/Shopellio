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
      ScrollView {
        Group {
          if proxy.size.width > proxy.size.height {
            HStack(alignment: .top) {
              ProductImageView(imageUrl: product.imageUrls.first)
              ProductDetailsDescriptionView(product: product)
            }
          } else {
            VStack(alignment: .leading) {
              ProductImageView(imageUrl: product.imageUrls.first)
              ProductDetailsDescriptionView(product: product)
            }
          }
          Button(Constants.ProductDetails.selectVariantButtonLabel) {
            isVariantSelectionShown = true
          }
          .buttonStyle(.borderedProminent)
          .foregroundColor(.invertedContrastColor)
        }
        .padding()
      }
      .scrollContentBackground(.hidden)
      .background(Color.backgroundColor)
      .sheet(isPresented: $isVariantSelectionShown) {
        NavigationStack {
          ProductVariantSelectionView(product: product)
        }
        .presentationDetents([.medium, .large])
      }
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ProductDetailsDescriptionView: View {
  var product: Product

  var body: some View {
    VStack(alignment: .leading) {
      Text(product.title)
        .titleStyle()
        .accessibilityIdentifier(Constants.Identifiers.productDetailsTitle)
      ProductPriceContainerView(product: product)
      HStack {
        Text(Constants.ProductDetails.colorsListLabel)
          .foregroundColor(.textColor)
          .font(.callout)
          .fontWeight(.semibold)
        ProductColorsView(colors: product.colors, isLimited: false)
      }
      HStack {
        Text(Constants.ProductDetails.sizesListLabel)
          .foregroundColor(.textColor)
          .font(.callout)
          .fontWeight(.semibold)
        ForEach(product.sizes, id: \.self) { sizeName in
          ProductSizeLabel(sizeName: sizeName)
        }
      }
      if let overview = product.overview {
        Text(overview)
          .defaultStyle()
      }
    }
  }
}

struct ProductDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ProductDetailsView(product: Shop.createFromFile().products[0])
    }
    .environmentObject(Shop.createFromFile())
    .environmentObject(Cart())
  }
}
