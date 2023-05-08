//
//  ProductDetailsDescriptionReviewsView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 04/05/2023.
//

import SwiftUI

struct ProductDetailsDescriptionReviewsView: View {
  var product: Product

  var body: some View {
    VStack(alignment: .center) {
      HStack {
        Text(Constants.ProductDetails.reviewsListLabel)
          .labelStyle()
        Spacer()
        HStack(
          alignment: .lastTextBaseline,
          spacing: Constants.ProductDetails.ratingSpacing
        ) {
          Image.starFill
            .foregroundColor(.accentColor)
          Text("\(product.getRatingString()) (\(product.reviews.count))")
            .headlineStyle()
        }
      }
      .padding(.bottom)
      if product.reviews.isEmpty {
        Text(Constants.ProductDetails.emptyReviewList)
          .defaultStyle()
      } else {
        VStack(
          alignment: .leading,
          spacing: Constants.ProductDetails.reviewsSpacing
        ) {
          ForEach(product.reviews) { review in
            ProductDetailsDescriptionReviewView(review: review)
          }
        }
      }
    }
  }
}

struct ProductDetailsDescriptionReviewView: View {
  var review: Review

  var body: some View {
    VStack(
      alignment: .leading,
      spacing: Constants.ProductDetails.reviewSpacing
    ) {
      HStack {
        ForEach(0..<5) { index in
          index < review.rating ?
          Image.starFill
            .foregroundColor(.accentColor) :
          Image.star
            .foregroundColor(.accentColor)
        }
      }
      if let text = review.text {
        Text(text)
          .defaultStyle()
          .italic()
      } else {
        Text(Constants.ProductDetails.emptyReviewMessage)
          .defaultStyle()
          .opacity(Constants.ProductDetails.emptyReviewMessageOpacity)
      }
    }
  }
}

struct ProductDetailsDescriptionReviewsView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      ProductDetailsDescriptionReviewsView(
        product: SampleData.products.allItems[0]
      )
    }
  }
}
