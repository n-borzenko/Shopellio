//
//  ProductImageView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductImageView: View {
  var imageUrl: String?

  var body: some View {
    Group {
      if let imageUrl = imageUrl {
        AsyncImage(url: URL(string: imageUrl)) { image in
          image
            .resizable()
            .scaledToFit()
        } placeholder: {
          ProgressView()
            .tint(.accentColor)
        }
      } else {
        Image.photo
          .resizable()
          .scaledToFit()
          .scaleEffect(Constants.Product.imagePlaceholderScale)
          .foregroundColor(.accentColor)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .aspectRatio(1, contentMode: .fit)
  }
}

struct ProductImageView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ProductImageView(imageUrl: SampleData.products[0].imageUrls.first)
      ProductImageView(imageUrl: nil)
    }
  }
}
