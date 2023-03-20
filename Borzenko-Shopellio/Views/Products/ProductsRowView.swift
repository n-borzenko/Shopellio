//
//  ProductsRowView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductsRowView: View {
  var product: Product

  var body: some View {
    HStack(alignment: .top) {
      ProductImageView(imageUrl: product.imageUrls.first)
        .frame(
          width: Constants.Products.productRowHeight,
          height: Constants.Products.productRowHeight
        )

      VStack(alignment: .leading) {
        Text(product.title)
          .defaultStyle()
          .lineLimit(Constants.Products.titleRowLineLimit)
        HStack {
          ProductPriceTextView(product: product)
          if product.tags.contains(Constants.General.newArrivalTag) {
            ProductTagView(product: product)
          }
        }
        ProductColorsView(product: product)
      }
    }
    .frame(maxHeight: Constants.Products.productRowHeight)
  }
}

struct ProductTagView: View {
  var product: Product

  var body: some View {
    Text(Constants.General.newArrivalTag.uppercased())
      .font(.caption)
      .foregroundColor(.backgroundColor)
      .padding(.horizontal, Constants.Products.tagRowHorizontalPadding)
      .background(
        RoundedRectangle(cornerRadius: Constants.Products.tagRowCornerRadius)
          .fill(Color.textColor)
      )
  }
}

struct ProductPriceTextView: View {
  var product: Product

  func getPriceString(price: Decimal) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(for: price) ?? Constants.General.unavailableString
  }

  var body: some View {
    HStack {
      if product.discount > 0 {
        Text(getPriceString(price: product.price))
          .defaultStyle()
          .fontWeight(.bold)
          .strikethrough()
      }
      Text(getPriceString(
        price: product.discount > 0 ? product.discountedPrice : product.price
      ))
      .foregroundColor(product.discount > 0 ? .red : .textColor)
      .fontWeight(.bold)
    }
  }
}

struct ProductColorsView: View {
  @EnvironmentObject var shop: Shop
  var product: Product

  var body: some View {
    HStack {
      ForEach(
        product.colors.prefix(Constants.Products.colorCircleLimit),
        id: \.self
      ) { colorName in
        Circle()
          .strokeBorder(
            Color.textColor,
            lineWidth: Constants.Products.colorCircleBorderWidth
          )
          .background(Circle().fill(
            Color(hex: shop.colors[colorName] ?? "") ?? .clear)
          )
          .frame(
            width: Constants.Products.colorCircleRowSize,
            height: Constants.Products.colorCircleRowSize
          )
      }
      if product.colors.count > Constants.Products.colorCircleLimit {
        Image.plusCircle
          .resizable()
          .scaledToFit()
          .frame(
            width: Constants.Products.colorCircleRowSize,
            height: Constants.Products.colorCircleRowSize
          )
          .foregroundColor(.accentColor)
      }
    }
  }
}

struct ProductsRowView_Previews: PreviewProvider {
  static var previews: some View {
    ProductsRowView(product: SampleData.products[1])
      .frame(width: .infinity, height: 100)
      .environmentObject(SampleData.shop)
  }
}
