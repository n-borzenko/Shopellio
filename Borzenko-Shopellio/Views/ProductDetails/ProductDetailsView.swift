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

  enum AnimationPosition {
    case none, start, middle, end
  }

  @State private var animationPosition = AnimationPosition.none

  func getX(proxy: GeometryProxy) -> Double {
    switch animationPosition {
    case .start: return 4.5 * (proxy.frame(in: .global).maxX / 5)
    case .middle, .end: return 3.0 * (proxy.frame(in: .global).maxX / 5)
    default: return -1000.0
    }
  }

  func getY(proxy: GeometryProxy) -> Double {
    switch animationPosition {
    case .start: return proxy.frame(in: .global).maxY
    case .middle: return proxy.frame(in: .global).maxY - proxy.frame(in: .global).maxY * 0.20
    case .end: return proxy.frame(in: .global).maxY + 100.0
    default: return -1000.0
    }
  }

  var product: Product

  var body: some View {
    GeometryReader { proxy in
      if animationPosition != .none {
        Image.basket
          .foregroundColor(.white)
          .padding(8.0)
          .background(
            Circle()
              .fill(Color.accentColor)
          )
          .position(x: getX(proxy: proxy), y: getY(proxy: proxy))
          .zIndex(1)
      }
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
                animationPosition = .start
                withAnimation(Animation.easeIn(duration: Constants.ProductDetails.animationStepDuration)) {
                  animationPosition = .middle
                }
                withAnimation(
                  Animation
                    .easeOut(duration: Constants.ProductDetails.animationStepDuration)
                    .delay(Constants.ProductDetails.animationStepDuration)
                ) {
                  animationPosition = .end
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.ProductDetails.animationStepDuration * 2) {
                  cart.addProduct(product: product, variant: variant)
                  animationPosition = .none
                }
              } label: {
                Text(Constants.ProductDetails.addToCartButtonTitle)
              }
              .disabled(animationPosition != .none)
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
