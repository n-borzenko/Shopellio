//
//  OnboardingView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import SwiftUI

struct OnboardingView: View {
  @Binding var onboardingIsShown: Bool
  
  var body: some View {
    ZStack {
      Color.backgroundColor
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: Constants.Onboarding.verticalSpacing) {
        OnboardingTopView(onboardingIsShown: $onboardingIsShown)
        
        ScrollView {
          VStack(
            alignment: .leading,
            spacing: Constants.Onboarding.verticalSpacing
          ) {
            HeadlineTextView(text: Constants.Onboarding.headlineText)
            FeatureListView()
            HStack {
              Spacer()
              FootnoteTextView(text: Constants.Onboarding.footnoteText)
              Spacer()
            }
          }
          .padding([.leading, .trailing, .bottom])
        }
      }
    }
  }
}

struct OnboardingTopView: View {
  @Binding var onboardingIsShown: Bool
  
  var body: some View {
    HStack {
      Spacer()
      Button(action: {
        onboardingIsShown = false
      }) {
        ImageCircleView(systemName: Constants.Images.xmarkCircle)
      }
    }
    .padding([.leading, .trailing, .top])
  }
}

struct FeatureListView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      TitleTextView(text: Constants.Onboarding.listTitle)
      
      ForEach(FeatureList.content, id: \.self) { feature in
        HStack(alignment: .firstTextBaseline) {
          let imageName = feature.implemented ? Constants.Images.checkmarkCircle : Constants.Images.emptyCircle
          Image(systemName: imageName)
            .foregroundColor(.accentColor)
          TextView(text: feature.title)
        }
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(onboardingIsShown: .constant(true))
  }
}
