//
//  TextViews.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import SwiftUI

struct HeadlineTextView: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.headline)
      .fontWeight(.medium)
      .foregroundColor(.textColor)
      .lineSpacing(Constants.General.headlineTextLineSpacing)
  }
}

struct TitleTextView: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.title3)
      .fontWeight(.semibold)
      .foregroundColor(.textColor)
  }
}

struct TextView: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.body)
      .foregroundColor(.textColor)
      .multilineTextAlignment(.leading)
  }
}

struct FootnoteTextView: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.footnote)
      .foregroundColor(.textColor)
      .multilineTextAlignment(.center)
      .textCase(.uppercase)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 16) {
      HeadlineTextView(text: "HeadlineTextView")
      TitleTextView(text: "TitleTextView")
      TextView(text: "TextView")
      FootnoteTextView(text: "FootnoteTextView")
    }
  }
}
