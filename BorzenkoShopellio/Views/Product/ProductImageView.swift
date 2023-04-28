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
        AsyncImage(url: URL(string: imageUrl)) { stage in
          switch stage {
          case .empty:
            LoadingView()
          case .success(let image):
            image
              .resizable()
              .scaledToFit()
          default:
            ProductPlaceholderImageView()
          }
        }
      } else {
        ProductPlaceholderImageView()
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .aspectRatio(1, contentMode: .fit)
  }
}

struct ProductPlaceholderImageView: View {
  var body: some View {
    Image.photo
      .resizable()
      .scaledToFit()
      .scaleEffect(Constants.Product.imagePlaceholderScale)
      .foregroundColor(.accentColor)

  }
}

struct ProductImageView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ProductImageView(imageUrl: SampleData.products.allItems[0].imageUrls.first)
      ProductImageView(imageUrl: nil)
    }
  }
}
