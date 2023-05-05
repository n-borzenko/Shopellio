//
//  ProductGroupsCellView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 31/03/2023.
//

import SwiftUI

struct ProductGroupsCellView: View {
  var group: any ProductGroup
  var footnote: String?

  var body: some View {
    GeometryReader { geo in
      VStack(alignment: .leading) {
        HStack {
          Text(group.title)
            .titleStyle()
            .multilineTextAlignment(.leading)
            .padding(.bottom, Constants.ProductGroups.titleBottomPadding)
          Spacer()
        }
        if let footnote = footnote {
          Text(footnote)
            .footnoteStyle()
            .textCase(.uppercase)
            .multilineTextAlignment(.leading)
        }
        Spacer()
      }
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        image?
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(
            width: geo.size.height / Constants.ProductGroups.imageWidthScale,
            height: geo.size.height / Constants.ProductGroups.imageWidthScale
          )
          .offset(
            x: geo.size.height * Constants.ProductGroups.imageOffsetScale,
            y: geo.size.height * Constants.ProductGroups.imageOffsetScale
          )
          .foregroundColor(.backgroundColor)
        ,
        alignment: .bottomTrailing
      )
    }
    .background(Color.cellBackgroundColor)
    .clipShape(RoundedRectangle(cornerRadius: Constants.ProductGroups.cellCornerRadius))
  }
}

extension ProductGroupsCellView {
  var image: Image? {
    switch group.id {
    case "men": return Image.mCircle
    case "women": return Image.wCircle
    case "sale": return Image.percent
    case "new": return Image.flame
    default: return nil
    }
  }
}

struct ProductGroupsCellView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      ProductGroupsCellView(
        group: SampleData.shop.categories[0],
        footnote: "1 item"
      )
      .frame(width: 200, height: 200)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.backgroundColor)
  }
}
