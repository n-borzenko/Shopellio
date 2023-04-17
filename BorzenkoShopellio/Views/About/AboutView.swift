//
//  AboutView.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    NavigationStack {
      AboutContentView()
        .background(Color.backgroundColor)
        .navigationTitle(Constants.About.navigationTitle)
    }
  }
}

struct AboutContentView: View {
  var body: some View {
    ScrollView {
      VStack(
        alignment: .leading,
        spacing: Constants.About.verticalSpacing
      ) {
        Text(Constants.About.headlineText)
          .headlineStyle()
        FeatureListView()
        ViewThatFits {
          HStack {
            ImageSourcesView()
          }
          VStack(alignment: .leading) {
            ImageSourcesView()
          }
        }
        HStack {
          Spacer()
          Text(Constants.About.footnoteText)
            .footnoteStyle()
          Spacer()
        }
      }
      .padding([.horizontal, .bottom])
    }
  }
}

struct ImageSourcesView: View {
  var body: some View {
    Text(Constants.About.productImagesDescription)
      .defaultStyle()
    Link(
      Constants.About.productImagesSourceTitle,
      // swiftlint:disable:next force_unwrapping
      destination: URL(string: Constants.About.productImagesSourceUrl)!
    )
    Text(Constants.About.illustrationsDescription)
      .defaultStyle()
    Link(
      Constants.About.illustrationsSourceTitle,
      // swiftlint:disable:next force_unwrapping
      destination: URL(string: Constants.About.illustrationsSourceUrl)!
    )
  }
}

struct FeatureListView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: Constants.About.featureListSpacing) {
      Text(Constants.About.listTitle)
        .titleStyle()

      ForEach(FeatureList.content, id: \.self) { feature in
        HStack(alignment: .firstTextBaseline) {
          (feature.implemented ? Image.checkmarkCircle : Image.emptyCircle)
            .foregroundColor(.accentColor)
          Text(feature.title)
            .defaultStyle()
        }
      }
    }
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
