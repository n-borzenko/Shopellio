//
//  ProductListItemView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 26/02/2023.
//

import SwiftUI

struct ProductListItemView: View {
  var product: Product

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        TextView(text: product.name)
          .fontWeight(.bold)
        Spacer()
        TextView(text: String(format: Constants.Product.priceFormat, product.price))
      }
      TextView(text: product.specification)
      if let category = product.category {
        TextView(text: category.rawValue.capitalized)
      }
      if !product.reviews.isEmpty {
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
    .padding()
    .background(
      RoundedRectangle(cornerRadius: Constants.Product.cornerRadius)
        .stroke(Color.textColor, lineWidth: Constants.Product.borderWidth)
    )
  }
}

struct ProductListItemView_Previews: PreviewProvider {
  static var previews: some View {
    ProductListItemView(product: ProductList.items[2])
  }
}