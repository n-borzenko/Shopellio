//
//  ProductDetailsImageGallery.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 04/05/2023.
//

import SwiftUI

struct HorizontalImageGallery: View {
  var imageUrls: [String]

  var body: some View {
    TabView {
      ForEach(imageUrls, id: \.self) { imageUrl in
        ProductImageView(imageUrl: imageUrl)
          .tag(imageUrl)
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .always))
    .aspectRatio(1, contentMode: .fit)
  }
}

struct VerticalImageGallery: View {
  var imageUrls: [String]

  var body: some View {
    ScrollView {
      ForEach(imageUrls, id: \.self) { imageUrl in
        ProductImageView(
          imageUrl: imageUrl,
          aspectRatio: nil,
          contentMode: .fill
        )
      }
      .padding(.trailing)
    }
  }
}

struct ProductDetailsImageGallery_Previews: PreviewProvider {
  static var previews: some View {
    HorizontalImageGallery(imageUrls: SampleData.products.allItems[1].imageUrls)
    VerticalImageGallery(imageUrls: SampleData.products.allItems[1].imageUrls)
  }
}
