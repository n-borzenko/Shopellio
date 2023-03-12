//
//  ProductListItemView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 26/02/2023.
//

import SwiftUI

struct ProductListItemView: View {
  @ObservedObject var cart: Cart
  var product: Product

  var body: some View {
    VStack(alignment: .leading) {
      ProductListItemSummaryView(product: product)
      ProductListItemStepperView(cart: cart, product: product)
      if !product.reviews.isEmpty {
        ProductListItemReviewsView(product: product)
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: Constants.Product.cornerRadius)
        .stroke(Color.textColor, lineWidth: Constants.Product.borderWidth)
    )
  }
}

struct ProductListItemSummaryView: View {
  var product: Product

  func getPriceString(price: Decimal) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(for: price) ?? Constants.General.unavailableString
  }

  var body: some View {
    HStack {
      TextView(text: product.name)
        .fontWeight(.bold)
      Spacer()
      TextView(text: getPriceString(price: product.price))
    }
    TextView(text: product.specification)
    if let category = product.category {
      TextView(text: category.rawValue.capitalized)
    }
  }
}

struct ProductListItemStepperView: View {
  @ObservedObject var cart: Cart
  var product: Product
  var itemCount: Int {
    cart.getItemCount(product: product)
  }

  var body: some View {
    Stepper(label: {
      if cart.getItemCount(product: product) > 0 {
        TextView(text: "\(Constants.Product.cartContentLabel) \(cart.getItemCount(product: product))")
      } else {
        TextView(text: Constants.Product.addToCartLabel)
      }
    }, onIncrement: {
      cart.addProduct(product: product)
    }, onDecrement: {
      cart.removeProduct(product: product)
    })
  }
}

struct ProductListItemReviewsView: View {
  var product: Product

  var body: some View {
    TextView(text: Constants.Product.reviews)
      .padding(.top)
    ForEach(product.reviews, id: \.self) { review in
      HStack {
        TextView(text: review.text)
        Spacer()
        HStack {
          ForEach(0..<Constants.Product.maxRating, id: \.self) {
            let imageName = $0 < review.rating ? Constants.Images.starFill : Constants.Images.star
            Image(systemName: imageName)
              .foregroundColor(.textColor)
          }
        }
      }
    }
  }
}

struct ProductListItemView_Previews: PreviewProvider {
  static var previews: some View {
    ProductListItemView(
      cart: Cart(items: [
        CartItem(product: ProductList.items[0], count: 1),
        CartItem(product: ProductList.items[3], count: 2)
      ]),
      product: ProductList.items[2]
    )
  }
}
