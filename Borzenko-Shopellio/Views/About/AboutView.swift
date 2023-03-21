//
//  AboutView.swift
//  Borzenko-Shopellio
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
            ImageSourceView()
          }
          VStack(alignment: .leading) {
            ImageSourceView()
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

struct ImageSourceView: View {
  var body: some View {
    Text(Constants.About.creditsText)
      .defaultStyle()
    Link(
      Constants.About.imageSourceTitle,
      // swiftlint:disable:next force_unwrapping
      destination: URL(string: Constants.About.imageSourceUrl)!
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
