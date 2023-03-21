//
//  ProductDetailsView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductDetailsView: View {
  @EnvironmentObject var cart: Cart
  @EnvironmentObject var shop: Shop
  @State private var selectedVariant: ProductVariant?

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
        }
        .padding()
      }
      .toolbar {
        ToolbarItemGroup(placement: .bottomBar) {
          if let variant = selectedVariant {
            HStack {
              ProductColorView(colorName: variant.color, isNameVisible: true, scale: .large)
              ProductSizeLabel(sizeName: variant.size, isNameVisible: true, scale: .large)
              Spacer()
              Button {
                cart.addProduct(product: product, variant: variant)
              } label: {
                Text(Constants.ProductDetails.addToCartButtonTitle)
              }
              .buttonStyle(.borderedProminent)
            }
          }
        }
      }
      .scrollContentBackground(.hidden)
      .background(Color.backgroundColor)
      .onAppear {
        // TODO: add selection control for size and color
        self.selectedVariant = product.stock[0].variant
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
      Spacer()
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
      ProductDetailsView(product: SampleData.products[0])
    }
    .environmentObject(SampleData.shop)
    .environmentObject(Cart())
  }
}
