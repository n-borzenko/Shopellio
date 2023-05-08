//
//  Text.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 13/03/2023.
//

import SwiftUI

extension Text {
  func headlineStyle() -> some View {
    self
      .font(.headline)
      .fontWeight(.bold)
      .foregroundColor(.textColor)
      .lineSpacing(Constants.General.headlineTextLineSpacing)
  }

  func titleStyle() -> some View {
    self
      .font(.title3)
      .fontWeight(.semibold)
      .foregroundColor(.textColor)
  }

  func defaultStyle() -> some View {
    self
      .font(.body)
      .foregroundColor(.textColor)
      .multilineTextAlignment(.leading)
  }

  func footnoteStyle() -> some View {
    self
      .font(.footnote)
      .foregroundColor(.textColor)
  }

  func labelStyle() -> some View {
    self
      .font(.callout)
      .foregroundColor(.textColor)
      .fontWeight(.semibold)
  }
}

struct Text_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 16) {
      Text("HeadlineTextView")
        .headlineStyle()
      Text("TitleTextView")
        .titleStyle()
      Text("TextView")
        .defaultStyle()
      Text("FootnoteTextView")
        .footnoteStyle()
      Text("LabelTextView")
        .labelStyle()
      Button { } label: {
        Text("Button text")
      }
    }
  }
}
