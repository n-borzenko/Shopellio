////
////  ProductImageView.swift
////  Borzenko-Shopellio
////
////  Created by Natalia Borzenko on 13/03/2023.
////
//
//import SwiftUI
//
//struct ProductImageView: View {
//  var imageURL: String
//
//  var body: some View {
//    Rectangle()
//      .fill(.white)
//      .aspectRatio(Constants.General.imagesAspectRatio, contentMode: .fill)
//      .overlay {
//        AsyncImage(url: URL(string: imageURL)) { image in
//          image
//            .resizable()
//            .scaledToFit()
//        } placeholder: {
//          ProgressView()
//            .tint(.accentColor)
//        }
//      }
//  }
//}
//
//struct ProductImageView_Previews: PreviewProvider {
//  static var previews: some View {
//    ProductImageView(imageURL: ProductList.items[0].imageURL)
//  }
//}
