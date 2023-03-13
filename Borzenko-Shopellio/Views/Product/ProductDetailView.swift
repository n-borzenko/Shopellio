//
//  ProductDetailView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 13/03/2023.
//

import SwiftUI

struct ProductDetailView: View {
  @ObservedObject var cart: Cart
  var product: Product

  var body: some View {
    ScrollView {
      VStack {
        ProductImageView(imageURL: product.imageURL)
        ProductDetailSummaryView(product: product)
        ProductDetailStepperView(cart: cart, product: product)
        if !product.reviews.isEmpty {
          ProductDetailReviewsView(product: product)
        }
      }
      .padding()
    }
    .navigationTitle(product.name)
    .navigationBarTitleDisplayMode(.large)
    .background(Color.backgroundColor)
  }
}

struct ProductDetailSummaryView: View {
  var product: Product

  func getPriceString(price: Decimal) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(for: price) ?? Constants.General.unavailableString
  }

  var body: some View {
    HStack {
      Text(product.name)
        .defaultStyle()
        .fontWeight(.bold)
      Spacer()
      Text(getPriceString(price: product.price))
        .defaultStyle()
    }
    Text(product.specification)
      .defaultStyle()
    if let category = product.category {
      Text(category.rawValue.capitalized)
        .defaultStyle()
    }
  }
}

struct ProductDetailStepperView: View {
  @ObservedObject var cart: Cart
  var product: Product
  var itemCount: Int {
    cart.getItemCount(product: product)
  }

  var body: some View {
    Stepper(label: {
      if cart.getItemCount(product: product) > 0 {
        Text("\(Constants.Product.cartContentLabel) \(cart.getItemCount(product: product))")
          .defaultStyle()
      } else {
        Text(Constants.Product.addToCartLabel)
          .defaultStyle()
      }
    }, onIncrement: {
      cart.addProduct(product: product)
    }, onDecrement: {
      cart.removeProduct(product: product)
    })
  }
}

struct ProductDetailReviewsView: View {
  var product: Product

  var body: some View {
    Text(Constants.Product.reviews)
      .defaultStyle()
      .padding(.top)
    ForEach(product.reviews, id: \.self) { review in
      HStack {
        Text(review.text)
          .defaultStyle()
        Spacer()
        HStack {
          ForEach(0..<Constants.Product.maxRating, id: \.self) {
            ($0 < review.rating ? Image.starFill : Image.star)
              .foregroundColor(.textColor)
          }
        }
      }
    }
  }
}

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ProductDetailView(
        cart: Cart(items: [
          CartItem(product: ProductList.items[0], count: 1),
          CartItem(product: ProductList.items[2], count: 2)
        ]),
        product: ProductList.items[2]
      )
    }
  }
}
